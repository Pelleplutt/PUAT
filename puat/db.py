#!/usr/bin/env python
# -*- coding: utf-8 -*-

import psycopg2

class DB(object):
    def __init__(self):
        self.conn = psycopg2.connect()

