
import json
from flask import request
from flask import render_template
from app import app, ACTIVE
from app.models import Users


@app.route('/')
def index():
    return render_template('index.html')


@app.route('/users')
def show_users():
    users = Users.query.filter_by(status=ACTIVE)
    users = [u.as_dict() for u in users]
    #return json.dumps(users)
    return render_template('users.html', users=users)


@app.route('/by-login')
def show_user_by_login():
    login = request.args.get('login')
    users = Users.query.filter_by(login=login)
    users = [u.as_dict() for u in users]
    #return json.dumps(users)
    return render_template('profile.html', user=users[0])


@app.route('/by-id')
def show_user_by_id():
    id = request.args.get('id')
    users = Users.query.filter_by(id=id)
    users = [u.as_dict() for u in users]
    #return json.dumps(users)
    return render_template('profile.html', user=users[0])

