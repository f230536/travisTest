#!/bin/bash
cd main
# For chrome
# lettuce -v 3 features/simple.feature chrome desktop-s
# lettuce -v 3 features/simple.feature chrome desktop-m
# lettuce -v 3 features/simple.feature chrome desktop-l

# lettuce -v 3 features/simple.feature chrome mobile-s
# lettuce -v 3 features/simple.feature chrome mobile-m
# lettuce -v 3 features/simple.feature chrome mobile-l
# lettuce -v 3 features/simple.feature chrome mobile-xl
array=( 'mobile-s' 'mobile-m' 'mobile-lg' 'mobile-xl' 'desktop-s' 'desktop-m' 'desktop-lg')

for i in "${array[@]}"
do
   :
   # do whatever on $i
   printf "%s\n" "$i"
   lettuce -v 3 features/simple.feature chrome $i
done
# For Firefox
# - lettuce -v 3 features/simple.feature chrome desktop-m
