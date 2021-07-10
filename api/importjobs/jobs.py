#!/usr/bin/env python
# -*- coding: utf-8 -*-

from flask import jsonify
from flask_restful import Resource

import puat.importjobs.jobs

class Jobs(Resource):
    def get(self):
        jobs = puat.importjobs.jobs.Jobs()
        joblist = jobs.fetch_active()
        return jsonify(joblist)