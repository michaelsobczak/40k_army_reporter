from . import app
from flask import render_template

@app.route('/')
def army_input_view():
    return render_template('web/army_input.html.jinja')

@app.route('/report')
def report_view():
    return render_template('web/report_view.html.jinja')