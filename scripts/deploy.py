import argparse

import os, sys
import json
from typing import List, Dict, Any
from subprocess import Popen,PIPE,STDOUT
import logging

DEFAULT_APP_NAME = 'armybuilder'
DEFAULT_ENV_NAME = 'armybuilder-production'
DEFAULT_STACK_NAME = '64bit Amazon Linux 2018.03 v2.14.0 running Docker 18.09.9-ce'

def run_aws_cmd(service: str, *args) -> Dict[Any, Any]:
    cmd_args = ["aws", service] + list(args)
    out = Popen(cmd_args, stderr=STDOUT, stdout=PIPE)
    output = out.communicate()[0].decode('ascii')
    logging.debug(f'{" ".join(cmd_args)}')
    retcode = out.returncode
    if retcode != 0:
        logging.error(f'Return code: {retcode} cmd: {" ".join(cmd_args)}')
        logging.error(f'{output}')
        return
    parsed_output = json.loads(output)
    logging.debug(f'{json.dumps(parsed_output, indent=4)}')
    return parsed_output

def run_ebs_cmd(*args) -> Dict[Any, Any]:
    return run_aws_cmd('elasticbeanstalk', *args)

def app_exists(appname: str):
    app_data = run_ebs_cmd('describe-applications')
    if not app_data:
        logging.error(f'unable to load existing application data')
    for app in app_data['Applications']:
        if app['ApplicationName'] == appname:
            logging.info(f'Found existing app {appname}')
            return True
    return False

def env_exists(appname: str, envname: str) -> bool:
    env_data = run_ebs_cmd('describe-environments', '--application-name', appname)
    if not env_data:
        logging.error(f'unable to load existing environment data')

    for env in env_data['Environments']:
        if env['EnvironmentName'] == envname:
            logging.info(f'Found existing environment {envname}')
            return True
    return False

def create_app(appname: str):
    logging.info("Creating new elasticbeanstalk application...")
    new_app = run_ebs_cmd('create-application', '--application-name', appname)
    logging.info(f"Successfully created new application {appname}!")
    logging.debug(json.dumps(new_app, indent=4))

def create_env(appname: str, envname: str, stackname: str):
    logging.info(f"Creating environment {envname} in {appname}")
    new_env = run_ebs_cmd('create-environment', '--application-name', appname, '--environment-name', envname, '--solution-stack-name', stackname)


def main(argv=None):
    parser = argparse.ArgumentParser()
    parser.add_argument('--verbose', action='store_true')
    parser.add_argument('--logfile', default=os.path.join(os.getcwd(), 'deploy.log'))
    parser.add_argument('--application-name', default=DEFAULT_APP_NAME)
    parser.add_argument('--environment-name', default=DEFAULT_ENV_NAME)
    parser.add_argument('--stack-name', default=DEFAULT_STACK_NAME)
    args = parser.parse_args(argv if argv else sys.argv[1:])
    if args.verbose:
        logging.basicConfig(level=logging.DEBUG)
    else:
        logging.basicConfig(level=logging.INFO)

    if not app_exists(args.application_name):
        create_app(args.application_name)
    
    if not env_exists(args.application_name, args.environment_name):
        create_env(args.application_name, args.environment_name, args.stack_name)

    

if __name__ == '__main__':
    sys.exit(main())