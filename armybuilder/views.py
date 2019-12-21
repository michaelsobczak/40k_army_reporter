from . import app, db
from flask import render_template, flash, redirect, url_for, request, abort
from flask_login import login_user, logout_user, current_user, login_required
from werkzeug.urls import url_parse
from .models import Roster, User, Wargear
from .forms import LoginForm, RegistrationForm
from .report import generate_report
import tempfile
from collections import defaultdict
from flask import render_template, g
from flask_login import logout_user

@app.route('/')
@app.route('/index')
@app.route('/rosters')
def rosters_view():
    rosters = db.session.query(Roster).all()
    return render_template('web/rosters.html.jinja', rosters=rosters)

@app.route('/roster/<int:roster_id>')
def roster_view(roster_id):
    roster = db.session.query(Roster).get(roster_id)
    return render_template('web/roster.html.jinja', roster=roster)


@app.route('/user/<int:user_id>')
def user_view(user_id):
    return render_template('web/user.html.jinja')


@app.route('/report/<int:roster_id>')
def report_roster_view(roster_id):
    roster = db.session.query(Roster).get(roster_id)
    return render_template('web/roster_view.html.jinja', roster=roster)

@app.route('/report/<int:roster_id>/<string:report_name>')
def report_view(roster_id, report_name):
    if 'report_view_memo' not in g:
        print("first yikes")
        g.report_view_memo = {}

    if roster_id not in g.report_view_memo or report_name not in g.report_view_memo[roster_id]:
        with tempfile.TemporaryDirectory() as tmpdir:
            print("second yikes")
            g.report_view_memo[roster_id] = generate_report(tmpdir, roster_id)
    return g.report_view_memo[roster_id][report_name]


@app.route('/login', methods=['GET', 'POST'])
def login():
    if current_user.is_authenticated:
        return redirect(url_for('army_input_view'))
    form = LoginForm()
    if form.validate_on_submit():
        user = User.query.filter_by(username=form.username.data).first()
        if user is None or not user.check_password(form.password.data):
            flash('Invalid username or password')
            return redirect(url_for('login'))
        login_user(user, remember=form.remember_me.data)
        return redirect(url_for('rosters_view'))
    return render_template('web/login.html.jinja', title='Sign In', form=form)

@app.route('/logout')
def logout():
    logout_user()
    return redirect(url_for('index'))

@app.route('/register', methods=['GET', 'POST'])
def register():
    if current_user.is_authenticated:
        return redirect(url_for('army_input_view'))
    form = RegistrationForm()
    if form.validate_on_submit():
        user = User(username=form.username.data, email=form.email.data)
        user.set_password(form.password.data)
        db.session.add(user)
        db.session.commit()
        flash('Congratulations, you are now a registered user!')
        return redirect(url_for('login'))
    return render_template('web/register.html.jinja', title='Register', form=form)