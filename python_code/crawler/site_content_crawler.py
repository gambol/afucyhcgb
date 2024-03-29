#!/usr/bin/env python
#coding=utf-8
# @author gambol
# @date 2012-7-21

# 将整站的内容爬取出来，以方便提取这个站点的简单描述
# 存储在site_crawler里
import os, re, threading

import MySQLdb  
import sys
import re
import urllib2
import time
import socket
import threadpool
import util

from fetch2 import get_content

socket.setdefaulttimeout(5)

reload(sys)
sys.setdefaultencoding("utf-8")

UTFPattern = re.compile(r"charset=utf", re.I)

(conn, cursor) = util.getConn()

def bulk_crawl(r):
    ping = 10000
    url = r[0]
    
    print "url:" + url
    html = "ERROR"

    try:
        html = get_content(url)
    except Exception, e:
        pass
        # 毫秒为单位

    if (html == "ERROR"):
        print "----error in get url:" + url
    else:
        sql = "insert into crawl.site_crawler(url, refresh_date, html) values ('%s', current_timestamp, '%s');" % (url, html)
        cursor.execute(sql)

#    ping_thread = Ping(url, serverId, sysId, category_id, name)
#    ping_thread.start()

def nouse(request, result):
    pass
    
def crawlSites():
    sql = 'select tophey.server_info.url from tophey.server_info left join crawl.site_crawler on tophey.server_info.url = crawl.site_crawler.url where crawl.site_crawler.html is NULL'
    cursor.execute(sql)

    data = cursor.fetchall()

    l = []
    for r in data:
        l.append(list(r))
    
    pool = threadpool.ThreadPool(5)
    requests = threadpool.makeRequests(bulk_crawl, l, nouse)
    [pool.putRequest(req) for req in requests]
    pool.wait()
    
if __name__ == "__main__":
    crawlSites()

conn.close()
