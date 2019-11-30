#!/usr/bin/python

import os
import argparse

if __name__  == '__main__':
    arg_parser = argparse.ArgumentParser(description="TB generator argument process")
    arg_parser.add_argument('-n', '--name', required=True, dest='uvc_name')
    arg_parser.add_argument('-o', '--output', required=True, dest='output_dir')
    arg_parser.add_argument('-s', '--slave', default=False, dest='has_slave', action="store_true")
    args = arg_parser.parse_args()

    script_dir = os.path.dirname(os.path.abspath(__file__))
    os.system("rm %s/* -rf" %args.output_dir)
    os.system("cp %s/tb/* %s -r" %(script_dir, args.output_dir))

    os.system("sed -i 's/default/%s/g' %s/sim/*" %(args.uvc_name, args.output_dir))
    os.system("sed -i 's/DEFAULT/%s/g' %s/sim/*" %(args.uvc_name.upper(), args.output_dir))
    if not args.has_slave:
        os.system("sed -i 's/default_master/%s/g' %s/include/*" %(args.uvc_name, args.output_dir))
        os.system("sed -i 's/DEFAULT_MASTER/%s/g' %s/include/*" %(args.uvc_name.upper(), args.output_dir))
        os.system("sed -i 's/default_master/%s/g' %s/src/sv/default_common/*" %(args.uvc_name, args.output_dir))
        os.system("sed -i 's/DEFAULT_MASTER/%s/g' %s/src/sv/default_common/*" %(args.uvc_name.upper(), args.output_dir))
        os.system("sed -i 's/default_master/%s/g' %s/src/sv/default_master/*" %(args.uvc_name, args.output_dir))
        os.system("sed -i 's/DEFAULT_MASTER/%s/g' %s/src/sv/default_master/*" %(args.uvc_name.upper(), args.output_dir))
        os.system("sed -i 's/default/%s/g' %s/include/*" %(args.uvc_name, args.output_dir))
        os.system("sed -i 's/DEFAULT/%s/g' %s/include/*" %(args.uvc_name.upper(), args.output_dir))
        os.system("sed -i 's/default/%s/g' %s/src/sv/default_common/*" %(args.uvc_name, args.output_dir))
        os.system("sed -i 's/DEFAULT/%s/g' %s/src/sv/default_common/*" %(args.uvc_name.upper(), args.output_dir))
        os.system("sed -i 's/default/%s/g' %s/src/sv/default_master/*" %(args.uvc_name, args.output_dir))
        os.system("sed -i 's/DEFAULT/%s/g' %s/src/sv/default_master/*" %(args.uvc_name.upper(), args.output_dir))
        os.system("sed -i '/slave/'d %s/include/default_pkg.sv" %(args.output_dir))
        os.system("sed -i '/env/'d %s/include/default_pkg.sv" %(args.output_dir))
        os.system("rm %s/src/sv/default_env -rf" %(args.output_dir))
        os.system("rm %s/src/sv/default_slave -rf" %(args.output_dir))
        os.system("rename default_master %s_agent %s/src/sv/default_master" %(args.uvc_name, args.output_dir))
        os.system("rename default_master %s %s/src/sv/%s_agent/*" %(args.uvc_name, args.output_dir, args.uvc_name))
    else:
        os.system("sed -i 's/default/%s/g' %s/include/*" %(args.uvc_name, args.output_dir))
        os.system("sed -i 's/DEFAULT/%s/g' %s/include/*" %(args.uvc_name.upper(), args.output_dir))
        os.system("sed -i 's/default/%s/g' %s/src/sv/default_common/*" %(args.uvc_name, args.output_dir))
        os.system("sed -i 's/DEFAULT/%s/g' %s/src/sv/default_common/*" %(args.uvc_name.upper(), args.output_dir))
        os.system("sed -i 's/default/%s/g' %s/src/sv/default_master/*" %(args.uvc_name, args.output_dir))
        os.system("sed -i 's/DEFAULT/%s/g' %s/src/sv/default_master/*" %(args.uvc_name.upper(), args.output_dir))
        os.system("sed -i 's/default/%s/g' %s/src/sv/default_env/*" %(args.uvc_name, args.output_dir))
        os.system("sed -i 's/DEFAULT/%s/g' %s/src/sv/default_env/*" %(args.uvc_name.upper(), args.output_dir))
        os.system("sed -i 's/default/%s/g' %s/src/sv/default_slave/*" %(args.uvc_name, args.output_dir))
        os.system("sed -i 's/DEFAULT/%s/g' %s/src/sv/default_slave/*" %(args.uvc_name.upper(), args.output_dir))
        os.system("rename default %s %s/src/sv/default_env" %(args.uvc_name, args.output_dir))
        os.system("rename default %s %s/src/sv/default_slave" %(args.uvc_name, args.output_dir))
        os.system("rename default %s %s/src/sv/%s_env/*" %(args.uvc_name, args.output_dir, args.uvc_name))
        os.system("rename default %s %s/src/sv/%s_slave/*" %(args.uvc_name, args.output_dir, args.uvc_name))
        os.system("rename default %s %s/src/sv/default_master" %(args.uvc_name, args.output_dir))
        os.system("rename default %s %s/src/sv/%s_master/*" %(args.uvc_name, args.output_dir, args.uvc_name))
    os.system("rename default %s %s/include/*" %(args.uvc_name, args.output_dir))
    os.system("rename default %s %s/src/sv/default_common" %(args.uvc_name, args.output_dir))
    os.system("rename default %s %s/src/sv/%s_common/*" %(args.uvc_name, args.output_dir, args.uvc_name))

    print("Agent %s generate done" %(args.uvc_name))
