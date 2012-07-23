#!/usr/bin/env python
#coding=utf-8
# @author gambol
# @date 2012-7-18
# 将parser的数据，插入到tophey数据库之中
# 主要工作，url去重, url规整, 并进行初步算分

import MySQLdb  
import sys
import re
import time
import socket
import re
import copy
import urlparse

reload(sys)
sys.setdefaultencoding( "utf-8" )

conn = MySQLdb.connect(host='127.0.0.1', user='gambol', unix_socket="/home/zhenbao.zhou/.local/share/akonadi/socket-localhost/mysql.socket", charset="utf8", db="crawl")
cursor = conn.cursor()
cursor.execute('set names "utf8"');

MAX_POSITION = 999999

def dealResult(result):
    lasturl = ""
    for r in result:
        id = r[0];
        name = r[1];
        line = r[2];
        description = r[3]
        url = urlNorm(r[4])
        title = r[5]
        category_id = r[6]
        origin_position = r[7]

        if (url == lasturl):
            pass
        else:
            insertDB(name, line, description, url, title, category_id, origin_position)

# 将url归一化
# 暂时不能做太多的事情
def urlNorm(url):
    url = url.strip()
    parsedTuple = urlparse.urlparse(url)
    #newUrl = urlparse.urljoin(parsedTuple)
    path = parsedTuple.path
    if [path == '']:
        path = "/"

    unparsedURL = ""
    if (parsedTuple.netloc.find("wan50.com") != -1):
        queryDict = urlparse.parse_qs(parsedTuple.query)
        if (queryDict.has_key('u')):
            for candidate in queryDict['u']:
                if candidate.find("http:") == 0:
                    return candidate
        else:
            unparsedURL = url
        pass
    else:
        unparsedURL = urlparse.urlunparse((parsedTuple.scheme, parsedTuple.netloc, path, parsedTuple.params, parsedTuple.query, ''))
    
    return unparsedURL

def insertDB(name, line, description, url, title, category_id, origin_position):
    select_url_sql = "select url from tophey.server_info where url = '%s'" % url;
    print select_url_sql
    cursor.execute(select_url_sql);
    result = cursor.fetchall();
    if (len(result) > 0):
        server_info_sql = "update tophey.server_info set name = '%s', description = '%s', title = '%s' where url = '%s' and category_id = %d" % (name, description, title, url, category_id)
        print server_info_sql
        cursor.execute(server_info_sql)
        
#        print result
        return
    
    server_info_sql = "insert into tophey.server_info(name, line, description, url, title, category_id, create_date, update_date) values('%s', '%s','%s', '%s', '%s', '%s', current_timestamp, current_timestamp);" % (name, line, description, url, title, category_id)
#    print server_info_sql
    cursor.execute(server_info_sql)

    cursor.execute("select last_insert_id();");
    lastId = str(int(cursor.fetchone()[0]))  
#    print lastId

    server_sys_info_sql = "insert into tophey.server_sys_info(id, name, category_id, refresh_date, score) values ('%s', '%s', %d, current_timestamp, %d);" % (lastId, name, category_id, MAX_POSITION - origin_position)
 #   print server_sys_info_sql
    cursor.execute(server_sys_info_sql)
    

if __name__ == "__main__":
    cursor.execute('select id,name, line, description, url, title,category_id, origin_position from crawl.parser_result  where id > 4930 order by url, origin_position asc');
    result = cursor.fetchall()
    dealResult(result)
    # url = urlNorm("http://advz/");
    # print url

    # insertDB('aaa', 'line', 'description', 'url', 'title', 4, 5)
    # print(urlNorm("http://cc.com"));
    # print(urlNorm("http://www.wan50.com/url.htm?u=http://www.femswow.com "));

conn.close()
