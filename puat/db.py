#!/usr/bin/env python
# -*- coding: utf-8 -*-

import psycopg2

class DB(object):
    def __init__(self, dbname, dbuser, dbpassword, dbhost, dbport):
        self.conn = psycopg2.connect(dbname=dbname, user=dbuser, password=dbpassword, host=dbhost, port=dbport)

