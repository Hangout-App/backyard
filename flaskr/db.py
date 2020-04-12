import pymysql

from flask import g


def get_db():
    if 'db' not in g:
        g.db = pymysql.connect(db='hangout', user='root', passwd='m@d@rc#0d', host='34.67.205.248', port=3306)
    return g.db


def close_db(e=None):
    db = g.pop('db', None)

    if db is not None:
        db.close()


def init_db():
    db = get_db()
