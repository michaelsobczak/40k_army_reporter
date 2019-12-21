from . import app, db
from .models import *
from flask import render_template, flash, redirect, url_for, request, abort, jsonify

@app.route('/v2/api/wargear', methods=['GET'])
def get_wargear():
    wargear = db.session.query(Wargear).all()
    return jsonify({
        'objects': [ w.jsondict for w in wargear ]
    })

@app.route('/v2/api/figure', methods=['GET'])
def get_figures():
    figures = db.session.query(Figure).all()
    return jsonify({
        'objects': [ f.jsondict for f in figures ]
    })

@app.route('/v2/api/figureprofile', methods=['GET'])
def get_figureprofiles():
    figureprofiles = db.session.query(FigureProfile).all()
    return jsonify({
        'objects': [ fp.jsondict for fp in figureprofiles ]
    })

@app.route('/v2/api/specialization', methods=['GET'])
def get_specializations():
    specs = db.session.query(Specialization).all()
    return jsonify({
        'objects': [ s.jsondict for s in specs ]
    })