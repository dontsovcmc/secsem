
import os
from flask import Flask
from flask_sqlalchemy import SQLAlchemy

basedir = os.path.abspath(os.path.dirname(__file__))

ACTIVE = 1
DEACTIVE = 0

DB_URI = os.environ.get('DB_URI', os.path.normpath(os.path.join(basedir, os.path.pardir, 'main.db')))

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = "sqlite:///" + DB_URI
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)

from app import routes
