#!/usr/bin/env python3

import sys
import yaml
import jinja2

def main():
  input_data = sys.stdin.read()

  yaml_report = yaml.safe_load(input_data)

  templateLoader = jinja2.FileSystemLoader(searchpath="/")
  templateEnv = jinja2.Environment(loader=templateLoader)
  TEMPLATE_FILE = "report_junit.xml.j2"
  template = templateEnv.get_template(TEMPLATE_FILE)
  outputText = template.render(data=yaml_report)
  f = open("/github/workspace/report_junit.xml", "w")
  f.write(outputText)
  f.close()

if __name__=="__main__":
  main()