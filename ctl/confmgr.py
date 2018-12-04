#! /usr/bin/env python3

import argparse
import yaml

class CLI:
    def __init__(self):
        self.parser = argparse.ArgumentParser(prog="confmgr")
        self.subparser = self.parser.add_subparsers(dest="cmd", help="sub-command help")

    def create_parser(self):
        self.create_merge()
        self.create_validate()
        self.create_divide()
        return self.parser

    def create_merge(self):
        sub_parser = self.subparser.add_parser('mergeinfo') 
        sub_parser.add_argument("--dns", required=True, dest="dns")
        sub_parser.add_argument("--bypass", required=True, dest="bypass")
        sub_parser.add_argument("--sskcp", required=True, dest="sskcp")
        sub_parser.add_argument("--info", required=True, dest="info")

    def create_validate(self):
        sub_parser = self.subparser.add_parser('validate') 
        sub_parser.add_argument("--info", required=True, dest="info")

    def create_divide(self):
        sub_parser = self.subparser.add_parser('divideinfo') 
        sub_parser.add_argument("--dns", required=True, dest="dns")
        sub_parser.add_argument("--bypass", required=True, dest="bypass")
        sub_parser.add_argument("--sskcp", required=True, dest="sskcp")
        sub_parser.add_argument("--info", required=True, dest="info")

class InfoMgr:
    def __init__(self, args, yamlwrapper):
        self.args = args
        self.yamlwrapper = yamlwrapper
        
    def mergeinfo(self):
        val = self.yamlwrapper.validate
        dnsfile, bypassfile, sskcpfile = self.args["dns"], self.args["bypass"], self.args["sskcp"]
        validated = val(dnsfile) and val(bypassfile) and val(sskcpfile)
        if validated:
            parse, write = self.yamlwrapper.parse, self.yamlwrapper.write_yaml
            dnsinfo, bypassinfo, sskcpinfo = parse(dnsfile), parse(bypassfile), parse(sskcpfile)
            info = {"dnsmasq": dnsinfo, "bypass": bypassinfo, "sskcp": sskcpinfo}
            write(info, self.args["info"])

    def validate(self):
        return self.yamlwrapper.validate(self.args["info"])

    def divideinfo(self):
        if self.validate():
            parse, write = self.yamlwrapper.parse, self.yamlwrapper.write_yaml
            content = parse(self.args["info"])
            write(content["dnsmasq"], self.args["dns"]) 
            write(content["bypass"], self.args["bypass"]) 
            write(content["sskcp"], self.args["sskcp"]) 

    def run(self):
        getattr(self, self.args["cmd"])()

class YamlWrapper:
    def validate(self, filename):
        # TODO: use schema to validate
        with open(filename, 'r') as stream:
            try:
                yaml.load(stream)
                print("%s is valid" % (filename))
                return True
            except yaml.YAMLError as exc:
                raise exc


    def parse(self, filename):
        with open(filename, 'r') as stream:
            try:
                return yaml.load(stream)
            except yaml.YAMLError as exc:
                print(exc)
                return {}

    def write_yaml(self, content, filename):
        with open(filename, 'w+') as stream:
            try:
                yaml.dump(content, stream, default_flow_style=False)
            except Error as exc:
                print(exc)

if __name__ == "__main__":
    parser = CLI().create_parser()
    InfoMgr(vars(parser.parse_args()), YamlWrapper()).run()


