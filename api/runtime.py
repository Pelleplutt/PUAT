#!/usr/bin/env python
# -*- coding: utf-8 -*-


import puat.db

db = None

def init():
    global db
    db = puat.db.DB()