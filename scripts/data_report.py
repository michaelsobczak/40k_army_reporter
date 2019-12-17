import argparse
import os
import sys
import matplotlib.pyplot as plt
from sklearn.preprocessing import StandardScaler
from sklearn.decomposition import PCA
import pandas as pd
from armybuilder import db
from armybuilder.models import *
from armybuilder.analytics.featurize import featurize_figures, featurize_wargear

def mk_csv(filename, headers, data):

    header_string = ','.join(headers)
    row_strings = [ ','.join([ str(q) for q in r]) for r in data ]
    full_str = '\n'.join([header_string] + row_strings)

    with open(filename, 'w') as csv_file:
        csv_file.write(full_str)

def generate_pca(csv_path: str, output_path: str, labels: list, features: list, show: bool):
    df = pd.read_csv(csv_path)
    # Separating out the features
    x = df.loc[:, features[:-1]].values# Separating out the target
    y = df.loc[:,['target']].values# Standardizing the features
    x = StandardScaler().fit_transform(x)

    pca = PCA(n_components=2)
    principalComponents = pca.fit_transform(x)
    
    principalDf = pd.DataFrame(data = principalComponents
                , columns = ['principal component 1', 'principal component 2'])
    
    finalDf = pd.concat([principalDf, df[['target']]], axis = 1)
    fig = plt.figure(figsize = (8,8))
    ax = fig.add_subplot(1,1,1) 
    ax.set_xlabel('Principal Component 1', fontsize = 15)
    ax.set_ylabel('Principal Component 2', fontsize = 15)
    ax.set_title('2 component PCA', fontsize = 20)
    targets = labels
    colors = ['r', 'g', 'b', 'c', 'm', 'y', 'k', 'w']
    for target, color in zip(targets,colors):
        indicesToKeep = finalDf['target'] == target
        px = finalDf.loc[indicesToKeep, 'principal component 1']
        py = finalDf.loc[indicesToKeep, 'principal component 2']
        ax.scatter(px
                , py
                , c = color
                ) #, s = 50)
    ax.legend(targets)
    ax.grid()
    fig.savefig(output_path)
    if show:
        plt.show()

def main(argv):
    parser = argparse.ArgumentParser()
    parser.add_argument('--output-dir', help='path to output generated', default=os.path.join(os.getcwd(), 'output'))
    parser.add_argument('--show', action='store_true', help='show plots', default=False)
    args = parser.parse_args(argv)

    def get_faction_label(fig) -> str:
        return fig.factions[0].name if fig.factions else ''

    figures = db.session.query(Figure).all()
    headers, labels, feats = featurize_figures(figures, get_faction_label)

    if not os.path.exists(args.output_dir):
        os.makedirs(args.output_dir)

    fig_feat_path = os.path.join(args.output_dir, 'figure_features.csv')
    fig_pca_path = os.path.join(args.output_dir, 'figure_pca.png')
    mk_csv(fig_feat_path, headers, feats)
    generate_pca(
        csv_path=fig_feat_path, 
        output_path=fig_pca_path,
        labels=labels, 
        features=headers, show=args.show)

    # def parse_wargear_type(w):
    #     wt = w.wargear_type
    #     tokens = wt.split(' ')
    #     weapon_type = ' '.join(tokens[:-1])
    #     weapon_num = tokens[-1]
    #     return weapon_type

    # wargear = db.session.query(Wargear).all()
    # headers, labels, feats = featurize_wargear(wargear, parse_wargear_type)
    # wargear_feat_path = os.path.join(args.output_dir, 'wargear_features.csv')
    # wargear_pca_path = os.path.join(args.output_dir, 'wargear_pca.png')
    # mk_csv(wargear_feat_path, headers, feats)
    # generate_pca(
    #     csv_path=wargear_feat_path,
    #     output_path=wargear_pca_path,
    #     labels=labels,
    #     features=headers, show=args.show
    # )
    return 0

if __name__ == '__main__':
    sys.exit(main(sys.argv[1:]))