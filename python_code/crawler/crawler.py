#!/usr/bin/env python
#coding=utf-8
# @author gambol
# @date 2012-7-18
# 爬虫

import MySQLdb  
import sys
import re
import urllib2
import getopt
import time
import socket
import re
from BeautifulSoup import BeautifulSoup

reload(sys)
sys.setdefaultencoding( "utf-8" )

socket.setdefaulttimeout(10)

conn = MySQLdb.connect(host='127.0.0.1', user='gambol', unix_socket="/home/zhenbao.zhou/.local/share/akonadi/socket-localhost/mysql.socket", charset="utf8", db="crawl")
cursor = conn.cursor()
cursor.execute('set names "utf8"');

commonPositionMap = {"名称|名字|私服":0,
              "线路" :0,
              "描述|介绍": 0,
              "链接" : 0,
              "地址" : 0,
              "标题" : 0,
              "版本|服务器说明" : 0,
              "IP"   : 0,
              "QQ"   : 0};


fieldCastDict = {"名称|名字|私服":'name',
              "线路" : 'line',
              "描述|介绍": 'description',
              "链接" : '',
              "地址" : 'exp',
              "标题" : 'title',
              "版本|服务器说明" : 'banben',
              "IP"   : 'jieshao',
              "url"  : "url",
              "QQ"   : 'qq'};


def fetchUrl(url):
    html = ""
    try:
        request = urllib2.Request(url)
        request.add_header('User-Agent', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN; rv:1.8.1.14) Gecko/20080404 (FoxPlus) Firefox/2.0.0.14')
        html = urllib2.urlopen(request).read()
    except:
        print "error in get content of "+url;
        
    return html

# deal with url, and put parse result into db
def dealUrlAndCategory(l):
    url = l[0]
    category_id = l[1]
    print "url:%s" %url
    
    html = fetchUrl(url)
    if (html == None or html == ""):
        return

    parserHtml(html, category_id)

def parserHtml(html, category_id):
    #print html
    soup = None
    if (html.find("charset=gb") != -1):
        soup = BeautifulSoup(html, fromEncoding='gb18030')
    else:
        soup = BeautifulSoup(html)
        
    (goodPositionMap,goodLineCounter, goodLinePartNum) = getGoodPostionMap(soup);
    print goodPositionMap
    print goodLineCounter
    if (goodLineCounter < 4):
        print "fuck, it is error"
        return

    trs = soup.findAll("tr");
    index = 1;
    for trContent in  trs:
        contentMap = getContent(trContent, goodPositionMap,  goodLinePartNum);
        if (contentMap != None):
            insertIntoDb(contentMap, category_id, index)
            index += 1

def insertIntoDb(contentMap, category_id, index):
    if (contentMap == None or not contentMap.has_key('url')):
        return

    allSqlFields = ["category_id", "origin_position"];
    valueFields = [str(category_id), str(index)];

    for key in contentMap.keys():
        value = "'" + contentMap[key] + "'"
        sqlField =  fieldCastDict[key] 
        valueFields.append(value)
        allSqlFields.append(sqlField)

    field  = ",".join(allSqlFields)
    value = ",".join(valueFields)
    sql = "insert into crawl.parser_result (%s) values (%s);" % (field, value)
    print sql

    cursor.execute(sql);
    

# 遍历全页面，找出最合适的一个模式
def getGoodPostionMap(soup):
    goodPositionMap = None
    goodLineCounter = 0
    goodLinePartNum = 0;
    lineContent = soup.findAll("tr")
    for partContent in lineContent:
        (positionMap, lineInfoCounter, linePartNum) = getPostionMap(partContent)
        if (lineInfoCounter > goodLineCounter):
            goodPositionMap = positionMap
            goodLinePartNum = linePartNum
            goodLineCounter = lineInfoCounter
        
    return (goodPositionMap, goodLineCounter, goodLinePartNum)

# 根据模式，选择出内容
def getContent(trContent, positionMap, goodLinePartNum):
    contentMap = {}
    tds = trContent.findAll("td")
    if (len(tds) != goodLinePartNum):
        return None

    index = 0

    reversedPostionMap = {}
    
    for key in positionMap.keys():
        if (positionMap[key] > 0):
            reversedPostionMap[positionMap[key]] = key

    for td in tds:
        index += 1
        text = "".join(td.findAll(text=True)).encode("UTF-8")
        url = td.findAll("a")
        if (reversedPostionMap.has_key(index)):
            contentMap[reversedPostionMap[index]] = text

        if (url != None and len(url) != 0):
            if (re.search("http://", url[0]["href"]) and not re.search("\.[rar|zip]", url[0]["href"])):
                contentMap['url'] = url[0]["href"]

    return contentMap

# 根据tr里 td内容，得到相关信息
def getPostionMap(trContent):
    positionMap = commonPositionMap

    tds = trContent.findAll(['th', 'td'])
    index = 0;
    
    for td in tds:
        index += 1
        text = td.text.encode("UTF-8")
        for key in positionMap.keys():
            #if (text.find(key) != -1):
            if (re.search(key, text)):
                positionMap[key] = index

    lineCounter = 0;
    for key in positionMap.keys():
        if (positionMap[key] != 0):
            lineCounter += 1
    

    # index 是这一行中 所有块的数目
    # lineCounter 是这一行中，含有制定信息的块的数目
    # if (lineCounter > 4):
    #     print positionMap
    #     print lineCounter
    #     print index
    #     print trContent
        
    return (positionMap, lineCounter, index)

# main function
if __name__ == "__main__":
    # cursor.execute('select url, category_id from crawl_source')
    # result = cursor.fetchall()
    
    # for r in result:
    #     dealUrlAndCategory(r);
    # f = open('www.8uu.com.htm').read()
    # f = open('www.yslead.com.htm').read()
    # f = open('www.bitiwow.com.htm').read()
    html = fetchUrl('http://www.bitiwow.com/');
    parserHtml(html, 2)

conn.close()  
