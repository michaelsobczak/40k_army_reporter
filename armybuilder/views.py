from . import app, db
from .models import Roster
from .report import generate_report
import tempfile
from collections import defaultdict
from flask import render_template, g

@app.route('/')
def army_input_view():
    return render_template('web/army_input.html.jinja')

@app.route('/report/<int:roster_id>')
def roster_view(roster_id):
    roster = db.session.query(Roster).get(roster_id)
    return render_template('web/roster_view.html.jinja', roster=roster)

@app.route('/report/<int:roster_id>/<string:report_name>')
def report_view(roster_id, report_name):
    if 'report_view_memo' not in g:
        g.report_view_memo = {}

    if roster_id not in g.report_view_memo or report_name not in g.report_view_memo[roster_id]:
        with tempfile.TemporaryDirectory() as tmpdir:
            g.report_view_memo[roster_id] = generate_report(tmpdir, roster_id)

    return g.report_view_memo[roster_id][report_name]