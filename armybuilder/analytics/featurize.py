from armybuilder.models import *
from armybuilder import db

from collections import defaultdict
from typing import Iterable, List, Any, Callable

EMPTY_VAL = -1
INVALID_VAL = -2

def clean_numeric(val: str) -> int:
    if not val:
        return INVALID_VAL
    elif isinstance(val, int):
        return val
    elif isinstance(val, float):
        return int(val)


    try:
        clean_str_val = val.replace('D', '').replace('+', '').replace('-', '').replace('"', '')
        if not clean_str_val:
            return EMPTY_VAL
        else:
            return int(clean_str_val)
    except:
        import traceback
        traceback.print_exc()
        return INVALID_VAL

def featurize_figures(figures: Iterable[Figure], target_attr_func):

    string_features = [
        'figure_type',
        'figure_name'
    ]
    numeric_features = [
        'points',
        'move',
        'weapon_skill',
        'ballistic_skill',
        'strength',
        'toughness',
        'wounds',
        'attacks',
        'leadership',
        'save',
        'max_number'
    ]
    features = []
    headers = numeric_features + ['target']
    labels = set()
    for f in figures:
        feature_row = []
        for nf in numeric_features:
            raw_val = getattr(f, nf)
            feature_row.append(clean_numeric(raw_val))
        l = target_attr_func(f)
        labels.add(l)
        feature_row.append(l)
        features.append(feature_row)
    return headers, labels, features


def featurize_wargear(wargear: Iterable[Wargear], target_attr_func):
    numeric_features = [
        'profile',
        'wargear_range',
        'strength',
        'ap',
        'damage',
        'points'
    ]



    features = []
    headers = numeric_features + ['target']
    labels = set()
    for w in wargear:
        feature_row = []
        for nf in numeric_features:
            raw_val = getattr(w, nf)
            feature_row.append(clean_numeric(raw_val))
        l = target_attr_func(w)
        labels.add(l)
        feature_row.append(l)
        features.append(feature_row)
    return headers, labels, features