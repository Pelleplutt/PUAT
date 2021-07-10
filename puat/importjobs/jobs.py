#!/usr/bin/env python
# -*- coding: utf-8 -*-

import api.runtime as runtime
class Jobs(object):
    def __init__(self):
        pass
        
    def _fetch_active(self):
        ret = []
        ret.append({
            'id': 0,
            'state': 'NEW',
            'parser': 'CSV',
            'create_ts': '2021-07-10 16:44:01+1',
        })
        return ret



    def fetch_active(self):
        cur = runtime.db.conn.cursor()
        cur.execute(
            """SELECT
                job_id,
                job_state,
                job_parser,
                job_create_ts

                FROM importjobs.jobs
                WHERE job_state IN ('NEW');"""
        )
        ret = []
        for j in cur:
            ret.append({
                'id': j[0],
                'state': j[1],
                'parser': j[2],
                'create_ts': j[3],
            })
        return ret