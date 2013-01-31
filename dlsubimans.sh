##Mine

##First, start a screen session to run this inside of

##VehYr2001-------------------------

star=301 #starting item #
fin=836 #last item # #836

##For loop through all docs on page
for i in $(seq $star $fin)
do 

##If using \ to escape "newlines" (ie go to the next line) ensure no spaces after \
curl -L \
--cookie cookme.txt \
--cookie-jar newcookies.txt \
"http://techinfo.subaru.com/proxy/11489/pdf/serviceManual/011489_2001_Legacy/\
G2280BEV1_"$i".pdf" \
> "La/G2280BEV1_"$i".pdf"

###Consider putting a test of whether or not the curl'ed file is >18kb
## Tell where we are in the process (print to screen)
#echo "***DEBUG*** "$i"  item La/G2280BEV1_"$i" received "$(date +"%c")"******"
echo "****La*** "$i"      ======"$(date +"%c")"======"

##If this is the 50th doc OR the last in the series, then sleep for 60 minutes and ...
##    ... one second. Otherwise between vehicle sets you may get an error.
###  Change this to outside the for loop to sleep between sets for elegance!!!
#if !(($i%50)) || (($i==$fin)); then sleep 3601; fi
if !(($i%50)); then sleep 3601; fi

done #with docs on page

#EndVeh2001===========================

<<COMMENT
##Sleep so that the last of the previous set of the just completed vehicle don't mess...
##   ...up the first 50 of the next vehicle
sleep 3601
COMMENT

#Veh2007-------------------------

star=497 #starting item #
fin=844 #last item # #844

#For through all docs on page
for i in $(seq $star $fin)
do

#If using \ to escape "newlines" (ie go to the next line) ensure no spaces after \
curl -L \
--cookie cookme.txt \
--cookie-jar newcookies.txt \
"http://techinfo.subaru.com/proxy/11037/pdf/serviceManual/011037_2007_Forester/\
G8110BEV21_"$i".pdf" \
> "Ka/G8110BEV21_"$i".pdf"

###Consider putting a test of whether or not the curl'ed file is >18kb
## Tell where we are in the process (print to screen)
#echo "***DEBUG*** "$i"  item Ka/G8110BEV21_"$i" received "$(date +"%c")"******"
echo "****Ka*** "$i"      ======"$(date +"%c")"======               "

##If this is the 50th doc OR the last in the series, then sleep for 60 minutes and ...
##    ... one second. Otherwise between vehicle sets you may get an error.
###  Change this to outside the for loop to sleep between sets for elegance!!!
#if !(($i%50)) || (($i==$fin)); then sleep 3601; fi
if !(($i%50)); then sleep 3601; fi

done #with docs on page
#EndVeh2007===========================
