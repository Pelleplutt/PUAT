#!/usr/bin/env python
# -*- coding: utf-8 -*-

from flask import Flask
from flask_restful import Resource, Api, reqparse

import api.importjobs.jobs

app = Flask(__name__)
flapi = Api(app)

flapi.add_resource(api.importjobs.jobs.Jobs, '/import.jobs')

if __name__ == "__main__":
    app.run(debug=True)