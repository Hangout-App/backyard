import pymysql

from flask import g


def get_db():
    if 'db' not in g:
        g.db = pymysql.connect(db='hangouts', user='root', passwd='m@d@rc#0d', host='35.229.20.55', port=3306)
    return g.db


def close_db(e=None):
    db = g.pop('db', None)

    if db is not None:
        db.close()


def init_db():
    db = get_db()
