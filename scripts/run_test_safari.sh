cd main
##lettuce -v 3 features/simple.feature safari desktop-m

array=( 'mobile-s' 'mobile-m' 'mobile-lg' 'mobile-xl' 'desktop-s' 'desktop-m' 'desktop-lg')

for i in "${array[@]}"
do
   :
   lettuce -v 3 features/simple.feature safari $i
done
