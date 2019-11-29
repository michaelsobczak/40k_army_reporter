from setuptools import setup

def parse_requirements(filename):
    """ load requirements from a pip requirements file """
    lineiter = (line.strip() for line in open(filename))
    return [line for line in lineiter if line and not line.startswith("#")]


setup(name='killteam-armybuilder',
        description='Web app to generate reports for Kill Team armies',
        long_description='',
        version='0.1.0',
        url='https://github.com/michaelsobczak/40k_army_reporter.git',
        author='M. Sobczak',
        author_email='michaelsobczak54@gmail.com',
        license='Apache2',
        classifiers=[
            'License :: OSI Approved :: Apache Software License',
            'Programming Language :: Python :: 3'
        ],
        packages=['armybuilder'],
        install_requires=[],
        setup_requires=["pytest-runner"],
        tests_require=["pytest"],
        entry_points={
        },
        include_package_data=True
)
