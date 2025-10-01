#!/usr/bin/env python3

import sys, getopt

def main(argv):
   inputs = '4'
   ra = ''
   sop = True
   try:
      opts, args = getopt.getopt(argv,"hir:p",["help=","inputs=","ra=","pos="])
   except getopt.GetoptError:
      print(sys.argv[0], ' --inputs <number_of_inputs> --ra <RA> --pos')
      sys.exit(2)
   for opt, arg in opts:
      if opt == '-h':
         print(sys.argv[0], ' --inputs <number_of_inputs> --ra <RA> --pos')
         sys.exit()
      elif opt in ("-i", "--inputs"):
         inputs = arg
      elif opt in ("-r", "--ra"):
         ra = arg
      elif opt in ("-p", "--pos"):
         sop = False
   print('Number of inputs is ', inputs)
   print('RA is ', ra)
   print("Sum of products mode" if sop else "Product os sums mode") 
   terms = []
   terms.extend(ra)
   min, max = ('1', '0') if sop else ('0', '1')
   
   for i in range(int(inputs)**2):
      print(str('{:0'+str(inputs)+'b}').format(i), '_', min if str(i) in terms else max, sep='')

   for i in range(int(inputs)**2):
      print(str('{:0'+str(int(inputs)//4)+'x}').format(i), '_', min if str(i) in terms else max, sep='')

if __name__ == "__main__":
   main(sys.argv[1:])
