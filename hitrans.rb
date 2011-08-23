﻿# HiTrans  
# Originally by Vinay P Jain based on ITRANS
# Adapted by Swapan (swapan@yahoo.com) for ruby
# Copyright Vinay P Jain under Creative Commons (by-nc-sa)
# http://creativecommons.org/licenses/by-nc-sa/2.5/
# -----------------------------------------------------
# Copied from hitrans.js hosted by VPJ
# -----------------------------------------------------

module HITRANS

  def HITRANS.convertHindi(strToConvert)

    mystr = strToConvert + ' '

    mystr.gsub!(/##/, "$")
    mystr.gsub!(/\$([^$]+)\$/) { "$"+$1.unpack('c*').to_s+"$" };
    mystr.gsub!(/(\\threedots)/," ... ");

    mystr.gsub!(/\.N/,"ँ");
    mystr.gsub!(/\.n/,"ं");
    mystr.gsub!(/\.m/,"ं");
    mystr.gsub!(/\.a/,"ऽ");
    mystr.gsub!(/\.h/,"‌्‌");
    mystr.gsub!(/\.e/,"ॅ");
    mystr.gsub!(/a\.u/,"ॉ");

    mystr.gsub!(/\.Dhaa\.c/,"ढ़ॉ");
    mystr.gsub!(/chhaa\.c/,"छॉ");
    mystr.gsub!(/dnyaa\.c/,"ज्ञॉ");
##    mystr.gsub!(/shhaa\.c/,"षॉ");
##    mystr.gsub!(/shhA\.c/,"षॉ");
    mystr.gsub!(/shaa\.c/,"शॉ");
    mystr.gsub!(/shhRRi/,"षृ");
    mystr.gsub!(/shhR\^i/,"षृ");
##    mystr.gsub!(/shhRi/,"षृ");
    mystr.gsub!(/thaa\.c/,"थॉ");
    mystr.gsub!(/phaa\.c/,"फॉ");
    mystr.gsub!(/dnyA\.c/,"ज्ञॉ");
    mystr.gsub!(/ghaa\.c/,"घॉ");
    mystr.gsub!(/jhaa\.c/,"झॉ");
    mystr.gsub!(/khaa\.c/,"खॉ");
    mystr.gsub!(/ldaa\.c/,"ल्दॉ");
    mystr.gsub!(/chhA\.c/,"छॉ");
    mystr.gsub!(/dhaa\.c/,"धॉ");
##    mystr.gsub!(/dnyRRi/,"ज्ञृ");
##    mystr.gsub!(/dnyR\^i/,"ज्ञृ");
##    mystr.gsub!(/dnyRi/,"ज्ञृ");
    mystr.gsub!(/bhaa\.c/,"भॉ");
    mystr.gsub!(/chaa\.c/,"चॉ");
    mystr.gsub!(/chhRRi/,"छृ");
    mystr.gsub!(/chhR\^i/,"छृ");
##    mystr.gsub!(/chhRi/,"छृ");
    mystr.gsub!(/Thaa\.c/,"ठॉ");
    mystr.gsub!(/\.DhA\.c/,"ढ़ॉ");
    mystr.gsub!(/Chaa\.c/,"छॉ");
    mystr.gsub!(/\.Daa\.c/,"ड़ॉ");
    mystr.gsub!(/Dhaa\.c/,"ढॉ");
    mystr.gsub!(/zaa\.c/,"ज़ॉ");
    mystr.gsub!(/yaa\.c/,"यॉ");
    mystr.gsub!(/Jaa\.c/,"ज़ॉ");
    mystr.gsub!(/GYA\.c/,"ज्ञॉ");
    mystr.gsub!(/Khaa\.c/,"ख़ॉ");
    mystr.gsub!(/Kaa\.c/,"ख़ॉ");
    mystr.gsub!(/Laa\.c/,"ळॉ");
    mystr.gsub!(/Naa\.c/,"णॉ");
    mystr.gsub!(/Gaa\.c/,"ग़ॉ");
    mystr.gsub!(/Daa\.c/,"डॉ");
    mystr.gsub!(/DhA\.c/,"ढॉ");
    mystr.gsub!(/DhRRi/,"ढृ");
    mystr.gsub!(/DhR\^i/,"ढृ");
##    mystr.gsub!(/DhRi/,"ढृ");
    mystr.gsub!(/\.Dh\.h/,"ढ़्‌");
    mystr.gsub!(/\.DA\.c/,"ड़ॉ");
    mystr.gsub!(/\.Dhuu/,"ढ़ू");
    mystr.gsub!(/ChA\.c/,"छॉ");
    mystr.gsub!(/\.Dhaa/,"ढ़ा");
    mystr.gsub!(/\.Dhii/,"ढ़ी");
    mystr.gsub!(/\.Dhai/,"ढ़ै");
    mystr.gsub!(/\.Dhau/,"ढ़ौ");
    mystr.gsub!(/ChRRi/,"छृ");
    mystr.gsub!(/ChR\^i/,"छृ");
##    mystr.gsub!(/ChRi/,"छृ");
    mystr.gsub!(/ThRRi/,"ठृ");
    mystr.gsub!(/ThR\^i/,"ठृ");
##    mystr.gsub!(/ThRi/,"ठृ");
    mystr.gsub!(/baa\.c/,"बॉ");
    mystr.gsub!(/bhRRi/,"भृ");
    mystr.gsub!(/bhR\^i/,"भृ");
    mystr.gsub!(/ShRRi/,"षृ");
    mystr.gsub!(/ShR\^i/,"षृ");
##    mystr.gsub!(/ShRi/,"षृ");
    mystr.gsub!(/ShA\.c/,"षॉ");
    mystr.gsub!(/Taa\.c/,"टॉ");
    mystr.gsub!(/ThA\.c/,"ठॉ");
    mystr.gsub!(/chA\.c/,"चॉ");
    mystr.gsub!(/chRRi/,"चृ");
    mystr.gsub!(/chR\^i/,"चृ");
##    mystr.gsub!(/chRi/,"चृ");
    mystr.gsub!(/bhA\.c/,"भॉ");
    mystr.gsub!(/caa\.c/,"चॉ");
    mystr.gsub!(/dhA\.c/,"धॉ");
    mystr.gsub!(/dhRRi/,"धृ");
    mystr.gsub!(/dhR\^i/,"धृ");
##    mystr.gsub!(/dhRi/,"धृ");
    mystr.gsub!(/chhii/,"छी");
    mystr.gsub!(/chhuu/,"छू");
    mystr.gsub!(/chhee/,"छी");
    mystr.gsub!(/chhoo/,"छू");
    mystr.gsub!(/chhai/,"छै");
    mystr.gsub!(/chhau/,"छौ");
    mystr.gsub!(/chh\.h/,"छ्‌");
    mystr.gsub!(/chhaa/,"छा");
    mystr.gsub!(/daa\.c/,"दॉ");
    mystr.gsub!(/ldA\.c/,"ल्दॉ");
    mystr.gsub!(/laa\.c/,"लॉ"); 
    mystr.gsub!(/maa\.c/,"मॉ");
    mystr.gsub!(/khA\.c/,"खॉ");
    mystr.gsub!(/khRRi/,"खृ");
    mystr.gsub!(/khR\^i/,"खृ");
##    mystr.gsub!(/khRi/,"खृ");
    mystr.gsub!(/jhA\.c/,"झॉ");
    mystr.gsub!(/kaa\.c/,"कॉ");
    mystr.gsub!(/ghA\.c/,"घॉ");
    mystr.gsub!(/haa\.c/,"हॉ");
    mystr.gsub!(/jaa\.c/,"जॉ");
    mystr.gsub!(/jhRRi/,"झृ");
    mystr.gsub!(/jhR\^i/,"झृ");
##    mystr.gsub!(/jhRi/,"झृ");
    mystr.gsub!(/dny\.h/,"ज्ञ्‌");
    mystr.gsub!(/dnyai/,"ज्ञै");
    mystr.gsub!(/dnyau/,"ज्ञौ");
    mystr.gsub!(/dnyaa/,"ज्ञा");
    mystr.gsub!(/dnyii/,"ज्ञी");
    mystr.gsub!(/dnyuu/,"ज्ञू");
    mystr.gsub!(/dnyee/,"ज्ञी");
    mystr.gsub!(/dnyoo/,"ज्ञू");
    mystr.gsub!(/faa\.c/,"फ़ॉ");
    mystr.gsub!(/gaa\.c/,"गॉ");
    mystr.gsub!(/ghRRi/,"घृ");
    mystr.gsub!(/ghR\^i/,"घृ");
    mystr.gsub!(/phA\.c/,"फॉ");
    mystr.gsub!(/phRRi/,"फृ");
    mystr.gsub!(/phR\^i/,"फृ");
##    mystr.gsub!(/phRi/,"फृ");
    mystr.gsub!(/naa\.c/,"नॉ");
    mystr.gsub!(/paa\.c/,"पॉ");
    mystr.gsub!(/qaa\.c/,"क़ॉ");
    mystr.gsub!(/raa\.c/,"रॉ");
    mystr.gsub!(/saa\.c/,"सॉ");
    mystr.gsub!(/shRRi/,"शृ");
    mystr.gsub!(/shR\^i/,"शृ");
##    mystr.gsub!(/shRi/,"शृ");
    mystr.gsub!(/shA\.c/,"शॉ");
    mystr.gsub!(/thRRi/,"थृ");
    mystr.gsub!(/thR\^i/,"थृ");
    mystr.gsub!(/taa\.c/,"तॉ");
    mystr.gsub!(/shhaa/,"षा");
    mystr.gsub!(/shh\.h/,"ष्‌");
    mystr.gsub!(/shhai/,"षै");
    mystr.gsub!(/shhau/,"षौ");
    mystr.gsub!(/shhii/,"षी");
    mystr.gsub!(/shhuu/,"षू");
    mystr.gsub!(/shhee/,"षी");
    mystr.gsub!(/shhoo/,"षू");
    mystr.gsub!(/thA\.c/,"थॉ");
    mystr.gsub!(/vaa\.c/,"वॉ");
    mystr.gsub!(/waa\.c/,"वॉ");
    mystr.gsub!(/xaa\.c/,"क्षॉ");
    mystr.gsub!(/xA\.c/,"क्षॉ");
##    mystr.gsub!(/xRRi/,"क्षृ");
##    mystr.gsub!(/xR\^i/,"क्षृ");
##    mystr.gsub!(/xRi/,"क्षृ");
    mystr.gsub!(/wRRi/,"वृ");
    mystr.gsub!(/wR\^i/,"वृ");
    mystr.gsub!(/vA\.c/,"वॉ");
    mystr.gsub!(/thaa/,"था");
    mystr.gsub!(/wA\.c/,"वॉ");
    mystr.gsub!(/thii/,"थी");
    mystr.gsub!(/thuu/,"थू");
    mystr.gsub!(/thee/,"थी");
    mystr.gsub!(/thoo/,"थू");
    mystr.gsub!(/vRRi/,"वृ");
    mystr.gsub!(/vR\^i/,"वृ");
##    mystr.gsub!(/vRi/,"वृ");
    mystr.gsub!(/shho/,"षो");
    mystr.gsub!(/shhu/,"षु");
    mystr.gsub!(/tA\.c/,"तॉ");
    mystr.gsub!(/shhe/,"षे");
    mystr.gsub!(/shhi/,"षि");
    mystr.gsub!(/shhA/,"षा");
    mystr.gsub!(/shhI/,"षी");
    mystr.gsub!(/shhU/,"षू");
    mystr.gsub!(/shha/,"ष");
    mystr.gsub!(/shai/,"शै");
    mystr.gsub!(/shau/,"शौ");
    mystr.gsub!(/shii/,"शी");
    mystr.gsub!(/shuu/,"शू");
    mystr.gsub!(/shee/,"शी");
    mystr.gsub!(/shoo/,"शू");
    mystr.gsub!(/tRRi/,"तृ");
    mystr.gsub!(/tR\^i/,"तृ");
##    mystr.gsub!(/tRi/,"तृ");
    mystr.gsub!(/thai/,"थै");
    mystr.gsub!(/thau/,"थौ");
    mystr.gsub!(/th\.h/,"थ्‌");
    mystr.gsub!(/shaa/,"शा");
    mystr.gsub!(/sh\.h/,"श्‌");
    mystr.gsub!(/sA\.c/,"सॉ");
    mystr.gsub!(/sRRi/,"सृ");
    mystr.gsub!(/sR\^i/,"सृ");
##    mystr.gsub!(/sRi/,"सृ");
    mystr.gsub!(/rA\.c/,"रॉ");
##    mystr.gsub!(/rRRi/,"र्ऋ");
##    mystr.gsub!(/rR\^i/,"र्ऋ");
    mystr.gsub!(/pA\.c/,"पॉ");
    mystr.gsub!(/ph\.h/,"फ्‌");
    mystr.gsub!(/pRRi/,"पृ");
    mystr.gsub!(/pR\^i/,"पृ");
    mystr.gsub!(/phaa/,"फा");
    mystr.gsub!(/phai/,"फै");
    mystr.gsub!(/phau/,"फौ");
    mystr.gsub!(/phii/,"फी");
    mystr.gsub!(/phuu/,"फू");
    mystr.gsub!(/phee/,"फी");
    mystr.gsub!(/phoo/,"फू");
    mystr.gsub!(/qA\.c/,"क़ॉ");
    mystr.gsub!(/gRRi/,"गृ");
    mystr.gsub!(/gR\^i/,"गृ");
##    mystr.gsub!(/gRi/,"गृ");
    mystr.gsub!(/gA\.c/,"गॉ");
    mystr.gsub!(/fA\.c/,"फ़ॉ");
    mystr.gsub!(/dnyo/,"ज्ञो");
    mystr.gsub!(/dnyu/,"ज्ञु");
    mystr.gsub!(/dhaa/,"धा");
    mystr.gsub!(/dnye/,"ज्ञे");
    mystr.gsub!(/dnyi/,"ज्ञि");
    mystr.gsub!(/dnyA/,"ज्ञा");
    mystr.gsub!(/dnyI/,"ज्ञी");
    mystr.gsub!(/jA\.c/,"जॉ");
    mystr.gsub!(/jh\.h/,"झ्‌");
    mystr.gsub!(/jRRi/,"जृ");
    mystr.gsub!(/jR\^i/,"जृ");
##    mystr.gsub!(/jRi/,"जृ");
    mystr.gsub!(/ghaa/,"घा");
    mystr.gsub!(/hRRi/,"हृ");
    mystr.gsub!(/hR\^i/,"हृ");
##    mystr.gsub!(/hRi/,"हृ");
    mystr.gsub!(/gh\.h/,"घ्‌");
    mystr.gsub!(/ghai/,"घै");
    mystr.gsub!(/ghau/,"घौ");
    mystr.gsub!(/ghii/,"घी");
    mystr.gsub!(/ghuu/,"घू");
    mystr.gsub!(/ghee/,"घी");
    mystr.gsub!(/ghoo/,"घू");
    mystr.gsub!(/hA\.c/,"हॉ");
    mystr.gsub!(/kRRi/,"कृ");
    mystr.gsub!(/kR\^i/,"कृ");
##    mystr.gsub!(/kRi/,"कृ");
    mystr.gsub!(/jhaa/,"झा");
    mystr.gsub!(/jhai/,"झै");
    mystr.gsub!(/jhau/,"झौ");
    mystr.gsub!(/jhii/,"झी");
    mystr.gsub!(/jhuu/,"झू");
    mystr.gsub!(/jhee/,"झी");
    mystr.gsub!(/jhoo/,"झू");
    mystr.gsub!(/kA\.c/,"कॉ");
    mystr.gsub!(/kh\.h/,"ख्‌");
    mystr.gsub!(/khai/,"खै");
    mystr.gsub!(/khau/,"खौ");
    mystr.gsub!(/khaa/,"खा");
    mystr.gsub!(/khii/,"खी");
    mystr.gsub!(/khuu/,"खू");
    mystr.gsub!(/khee/,"खी");
    mystr.gsub!(/khoo/,"खू");
    mystr.gsub!(/lRRi/,"लृ");
    mystr.gsub!(/lR\^i/,"लृ");
##    mystr.gsub!(/lRi/,"लृ");
    mystr.gsub!(/mA\.c/,"मॉ");
    mystr.gsub!(/mRRi/,"मृ");
    mystr.gsub!(/mR\^i/,"मृ");
##    mystr.gsub!(/mRi/,"मृ");
    mystr.gsub!(/nA\.c/,"नॉ");
    mystr.gsub!(/nRRi/,"नृ");
    mystr.gsub!(/nR\^i/,"नृ");
##    mystr.gsub!(/nRi/,"नृ");
    mystr.gsub!(/lA\.c/,"लॉ");
    mystr.gsub!(/ldaa/,"ल्दा");
    mystr.gsub!(/ld\.h/,"ल्द्");
    mystr.gsub!(/ldai/,"ल्दै");
    mystr.gsub!(/ldau/,"ल्दौ");
    mystr.gsub!(/ldii/,"ल्दी");
    mystr.gsub!(/lduu/,"ल्दू");
    mystr.gsub!(/dA\.c/,"दॉ");
    mystr.gsub!(/dRRi/,"दृ");
    mystr.gsub!(/dR\^i/,"दृ");
##    mystr.gsub!(/dRi/,"दृ");
    mystr.gsub!(/chhA/,"छा");
    mystr.gsub!(/choo/,"चू");
    mystr.gsub!(/chuu/,"चू");
    mystr.gsub!(/chhe/,"छे");
    mystr.gsub!(/chhi/,"छि");
    mystr.gsub!(/chho/,"छो");
    mystr.gsub!(/chhu/,"छु");
    mystr.gsub!(/chhI/,"छी");
    mystr.gsub!(/dh\.h/,"ध्‌");
    mystr.gsub!(/dnyU/,"ज्ञू");
    mystr.gsub!(/dnya/,"ज्ञ");
    mystr.gsub!(/dhai/,"धै");
    mystr.gsub!(/dhau/,"धौ");
    mystr.gsub!(/dhii/,"धी");
    mystr.gsub!(/dhuu/,"धू");
    mystr.gsub!(/dhee/,"धी");
    mystr.gsub!(/dhoo/,"धू");
    mystr.gsub!(/CA\.c/,"चॉ");
    mystr.gsub!(/CRRi/,"चृ");
    mystr.gsub!(/CR\^i/,"चृ");
##    mystr.gsub!(/CRi/,"चृ");
    mystr.gsub!(/bhaa/,"भा");
    mystr.gsub!(/bh\.h/,"भ्‌");
    mystr.gsub!(/bhai/,"भै");
    mystr.gsub!(/bhau/,"भौ");
    mystr.gsub!(/bhii/,"भी");
    mystr.gsub!(/bhuu/,"भू");
    mystr.gsub!(/bhee/,"भी");
    mystr.gsub!(/bhoo/,"भू");
    mystr.gsub!(/ch\.h/,"च्‌");
    mystr.gsub!(/chhU/,"छू");
    mystr.gsub!(/chha/,"छ");
    mystr.gsub!(/chai/,"चै");
    mystr.gsub!(/chau/,"चौ");
    mystr.gsub!(/chaa/,"चा");
    mystr.gsub!(/chii/,"ची");
    mystr.gsub!(/chee/,"ची");
    mystr.gsub!(/Th\.h/,"ठ्‌");
    mystr.gsub!(/TA\.c/,"टॉ");
    mystr.gsub!(/Shaa/,"षा");
    mystr.gsub!(/Shii/,"षी");
    mystr.gsub!(/Shuu/,"षू");
    mystr.gsub!(/Shee/,"षी");
    mystr.gsub!(/Shoo/,"षू");
    mystr.gsub!(/TRRi/,"टृ");
    mystr.gsub!(/TR\^i/,"टृ");
    mystr.gsub!(/Shai/,"षै");
    mystr.gsub!(/Shau/,"षौ");
    mystr.gsub!(/Sh\.h/,"ष्‌");
    mystr.gsub!(/bA\.c/,"बॉ");
    mystr.gsub!(/Thaa/,"ठा");
    mystr.gsub!(/bRRi/,"बृ");
    mystr.gsub!(/bR\^i/,"बृ");
##    mystr.gsub!(/bRi/,"बृ");
    mystr.gsub!(/Thai/,"ठै");
    mystr.gsub!(/Thau/,"ठौ");
    mystr.gsub!(/Thii/,"ठी");
    mystr.gsub!(/Thuu/,"ठू");
    mystr.gsub!(/Thee/,"ठी");
    mystr.gsub!(/Thoo/,"ठू");
    mystr.gsub!(/\.Dhe/,"ढ़े");
    mystr.gsub!(/\.Dhi/,"ढ़ि");
    mystr.gsub!(/\.Dho/,"ढ़ो");
    mystr.gsub!(/\.Dhu/,"ढ़ु");
    mystr.gsub!(/\.DhI/,"ढ़ी");
    mystr.gsub!(/Chaa/,"छा");
    mystr.gsub!(/Ch\.h/,"छ्‌");
    mystr.gsub!(/Chai/,"छै");
    mystr.gsub!(/Chau/,"छौ");
    mystr.gsub!(/Chii/,"छी");
    mystr.gsub!(/Chuu/,"छू");
    mystr.gsub!(/Chee/,"छी");
    mystr.gsub!(/Choo/,"छू");
##    mystr.gsub!(/\.D\.h/,"ड़्‌");
    mystr.gsub!(/\.Dai/,"ड़ै");
    mystr.gsub!(/\.Dau/,"ड़ौ");
    mystr.gsub!(/\.DhA/,"ढ़ा");
    mystr.gsub!(/\.Duu/,"ड़ू");
    mystr.gsub!(/\.Doo/,"ड़ू");
    mystr.gsub!(/\.Daa/,"ड़ा");
    mystr.gsub!(/\.Dii/,"ड़ी");
    mystr.gsub!(/\.Dee/,"ड़ी");
    mystr.gsub!(/\.DhU/,"ढ़ू");
    mystr.gsub!(/\.Dha/,"ढ़");
    mystr.gsub!(/Dh\.h/,"ढ्‌");
    mystr.gsub!(/DA\.c/,"डॉ");
    mystr.gsub!(/DRRi/,"डृ");
    mystr.gsub!(/DR\^i/,"डृ");
##    mystr.gsub!(/DRi/,"डृ");
    mystr.gsub!(/Dhuu/,"ढू");
    mystr.gsub!(/Dhoo/,"ढू");
    mystr.gsub!(/GA\.c/,"ग़ॉ");
    mystr.gsub!(/GY\.h/,"ज्ञ्‌");
    mystr.gsub!(/Dhai/,"ढै");
    mystr.gsub!(/Dhau/,"ढौ");
    mystr.gsub!(/Dhaa/,"ढा");
    mystr.gsub!(/Dhii/,"ढी");
    mystr.gsub!(/Dhee/,"ढी");
    mystr.gsub!(/GRRi/,"ग़ृ");
    mystr.gsub!(/GR\^i/,"ग़ृ");
##    mystr.gsub!(/GRi/,"ग़ृ");
    mystr.gsub!(/NA\.c/,"णॉ");
    mystr.gsub!(/NRRi/,"णृ");
    mystr.gsub!(/NR\^i/,"णृ");
##    mystr.gsub!(/NRi/,"णृ");
    mystr.gsub!(/KhA\.c/,"ख़ॉ");
    mystr.gsub!(/KA\.c/,"ख़ॉ");
    mystr.gsub!(/LA\.c/,"ळॉ");
    mystr.gsub!(/GYaa/,"ज्ञा");
    mystr.gsub!(/GYai/,"ज्ञै");
    mystr.gsub!(/GYau/,"ज्ञौ");
    mystr.gsub!(/GYee/,"ज्ञी");
    mystr.gsub!(/GYoo/,"ज्ञू");
    mystr.gsub!(/GYii/,"ज्ञी");
    mystr.gsub!(/GYuu/,"ज्ञू");
    mystr.gsub!(/JA\.c/,"ज़ॉ");
    mystr.gsub!(/JN\.h/,"ज्ञ्‌");
    mystr.gsub!(/yA\.c/,"यॉ");
##    mystr.gsub!(/zRRi/,"ज़ृ");
##    mystr.gsub!(/zR\^i/,"ज़ृ");
##    mystr.gsub!(/yRRi/,"यृ");
##    mystr.gsub!(/yR\^i/,"यृ");
##    mystr.gsub!(/yRi/,"यृ");
    mystr.gsub!(/zA\.c/,"ज़ॉ");
    mystr.gsub!(/~N\.h/,"ङ्‌");
    mystr.gsub!(/~n\.h/,"ञ्‌");
    mystr.gsub!(/aa\.c/,"ऑ");
    mystr.gsub!(/A\.c/,"ऑ");
##    mystr.gsub!(/R\^I/,"ॠ");
##    mystr.gsub!(/RRI/,"ॠ");
##    mystr.gsub!(/RI/,"ॠ");
    mystr.gsub!(/AUM/,"ॐ");
    mystr.gsub!(/OM/,"ॐ");
    mystr.gsub!(/R\^i/,"ऋ");
    mystr.gsub!(/RRi/,"ऋ");
##    mystr.gsub!(/Ri/,"ऋ");
    mystr.gsub!(/e\.c/,"ऍ");

    mystr.gsub!(/\.c/,"ॅ");

    mystr.gsub!(/~no/,"ञो");
    mystr.gsub!(/~nu/,"ञु");
    mystr.gsub!(/~ne/,"ञे");
    mystr.gsub!(/~ni/,"ञि");
    mystr.gsub!(/~No/,"ङो");
    mystr.gsub!(/~Nu/,"ङु");
    mystr.gsub!(/~nA/,"ञा");
    mystr.gsub!(/~nI/,"ञी");
    mystr.gsub!(/~nU/,"ञू");
    mystr.gsub!(/~na/,"ञ");
    mystr.gsub!(/~Ne/,"ङे");
    mystr.gsub!(/~Ni/,"ङि");
    mystr.gsub!(/~NA/,"ङा");
    mystr.gsub!(/~NI/,"ङी");
    mystr.gsub!(/~NU/,"ङू");
    mystr.gsub!(/~Na/,"ङ");
    mystr.gsub!(/yaa/,"या");
    mystr.gsub!(/zaa/,"ज़ा");
    mystr.gsub!(/yuu/,"यू");
    mystr.gsub!(/yoo/,"यू");
    mystr.gsub!(/z\.h/,"ज़्‌");
    mystr.gsub!(/zai/,"ज़ै");
    mystr.gsub!(/zau/,"ज़ौ");
    mystr.gsub!(/zii/,"ज़ी");
    mystr.gsub!(/zuu/,"ज़ू");
    mystr.gsub!(/waa/,"वा");
    mystr.gsub!(/xaa/,"क्षा");
    mystr.gsub!(/xee/,"क्षी");
    mystr.gsub!(/xoo/,"क्षू");
    mystr.gsub!(/xii/,"क्षी");
    mystr.gsub!(/xuu/,"क्षू");
    mystr.gsub!(/y\.h/,"य्‌");
    mystr.gsub!(/yii/,"यी");
    mystr.gsub!(/yai/,"यै");
    mystr.gsub!(/yau/,"यौ");
    mystr.gsub!(/Kh\.h/,"ख़्‌");
    mystr.gsub!(/K\.h/,"ख़्‌");
    mystr.gsub!(/JNai/,"ज्ञै");
    mystr.gsub!(/JNoo/,"ज्ञू");
    mystr.gsub!(/JNo/,"ज्ञो");
    mystr.gsub!(/JNuu/,"ज्ञू");
    mystr.gsub!(/JNu/,"ज्ञु");
    mystr.gsub!(/JNee/,"ज्ञी");
    mystr.gsub!(/JNii/,"ज्ञी");
    mystr.gsub!(/Jaa/,"ज़ा");
    mystr.gsub!(/JNe/,"ज्ञे");
    mystr.gsub!(/JNi/,"ज्ञि");
    mystr.gsub!(/JNA/,"ज्ञा");
    mystr.gsub!(/JNI/,"ज्ञी");
    mystr.gsub!(/JNU/,"ज्ञू");
    mystr.gsub!(/JNa/,"ज्ञ");
    mystr.gsub!(/Jai/,"ज़ै");
    mystr.gsub!(/Jau/,"ज़ौ");
    mystr.gsub!(/Jee/,"ज़ी");
    mystr.gsub!(/Joo/,"ज़ू");
    mystr.gsub!(/Jii/,"ज़ी");
    mystr.gsub!(/Juu/,"ज़ू");
    mystr.gsub!(/J\.h/,"ज़्‌");
    mystr.gsub!(/GYo/,"ज्ञो");
    mystr.gsub!(/GYu/,"ज्ञु");
    mystr.gsub!(/GYe/,"ज्ञे");
    mystr.gsub!(/GYi/,"ज्ञि");
    mystr.gsub!(/Gaa/,"ग़ा");
    mystr.gsub!(/GYI/,"ज्ञी");
    mystr.gsub!(/GYU/,"ज्ञू");
    mystr.gsub!(/GYa/,"ज्ञ");
    mystr.gsub!(/Khaa/,"ख़ा");
    mystr.gsub!(/Kaa/,"ख़ा");
    mystr.gsub!(/Laa/,"ळा");
    mystr.gsub!(/Khuu/,"ख़ू");
    mystr.gsub!(/Khoo/,"ख़ू");
    mystr.gsub!(/Kuu/,"ख़ू");
    mystr.gsub!(/Koo/,"ख़ू");
    mystr.gsub!(/L\.h/,"ळ्‌");
    mystr.gsub!(/Khii/,"ख़ी");
    mystr.gsub!(/Kii/,"ख़ी");
    mystr.gsub!(/Khee/,"ख़ी");
    mystr.gsub!(/Kee/,"ख़ी");
    mystr.gsub!(/Khai/,"ख़ै");
    mystr.gsub!(/Kai/,"ख़ै");
    mystr.gsub!(/Khau/,"ख़ौ");
    mystr.gsub!(/Kau/,"ख़ौ");
    mystr.gsub!(/Lai/,"ळै");
    mystr.gsub!(/Lau/,"ळौ");
    mystr.gsub!(/Lee/,"ळी");
    mystr.gsub!(/Loo/,"ळू");
    mystr.gsub!(/Lii/,"ळी");
    mystr.gsub!(/Luu/,"ळू");
    mystr.gsub!(/N\.h/,"ण्‌");
    mystr.gsub!(/Nai/,"णै");
    mystr.gsub!(/Nau/,"णौ");
    mystr.gsub!(/Nee/,"णी");
    mystr.gsub!(/Noo/,"णू");
    mystr.gsub!(/Nii/,"णी");
    mystr.gsub!(/Nuu/,"णू");
    mystr.gsub!(/Dho/,"ढो");
    mystr.gsub!(/Dhu/,"ढु");
    mystr.gsub!(/Daa/,"डा");
    mystr.gsub!(/Dhe/,"ढे");
    mystr.gsub!(/Dhi/,"ढि");
    mystr.gsub!(/GYA/,"ज्ञा");
    mystr.gsub!(/Guu/,"ग़ू");
    mystr.gsub!(/Gii/,"ग़ी");
    mystr.gsub!(/G\.h/,"ग़्‌");
    mystr.gsub!(/Gai/,"ग़ै");
    mystr.gsub!(/Gau/,"ग़ौ");
    mystr.gsub!(/D\.h/,"ड्‌");
    mystr.gsub!(/Dai/,"डै");
    mystr.gsub!(/Dau/,"डौ");
    mystr.gsub!(/DhA/,"ढा");
    mystr.gsub!(/DhI/,"ढी");
    mystr.gsub!(/Dee/,"डी");
    mystr.gsub!(/Doo/,"डू");
    mystr.gsub!(/Dii/,"डी");
    mystr.gsub!(/Duu/,"डू");
    mystr.gsub!(/DhU/,"ढू");
    mystr.gsub!(/Dha/,"ढ");

    mystr.gsub!(/Ghoo/,"ग़ू");
    mystr.gsub!(/Ghuu/,"ग़ू");
    mystr.gsub!(/Ghau/,"ग़ौ");
    mystr.gsub!(/Ghai/,"ग़ै");
    mystr.gsub!(/Ghu/,"ग़ु");
    mystr.gsub!(/Ghee/,"ग़ी");
    mystr.gsub!(/Ghe/,"ग़े");
    mystr.gsub!(/Ghii/,"ग़ी");
    mystr.gsub!(/Ghi/,"ग़ि");
    mystr.gsub!(/Ghaa/,"ग़ा");
    mystr.gsub!(/Gho/,"ग़ो");
    mystr.gsub!(/GhA/,"ग़ा");
    mystr.gsub!(/GhI/,"ग़ी");
    mystr.gsub!(/GhU/,"ग़ू");
    mystr.gsub!(/Gha/,"ग़");

    mystr.gsub!(/Rhoo/,"ढ़ू");
    mystr.gsub!(/Rhuu/,"ढ़ू");
    mystr.gsub!(/Rhau/,"ढ़ौ");
    mystr.gsub!(/Rhai/,"ढ़ै");
    mystr.gsub!(/Rhu/,"ढ़ु");
    mystr.gsub!(/Rhee/,"ढ़ी");
    mystr.gsub!(/Rhe/,"ढ़े");
    mystr.gsub!(/Rhii/,"ढ़ी");
    mystr.gsub!(/Rhi/,"ढ़ि");
    mystr.gsub!(/Rhaa/,"ढ़ा");
    mystr.gsub!(/Rho/,"ढ़ो");
    mystr.gsub!(/RhA/,"ढ़ा");
    mystr.gsub!(/RhI/,"ढ़ी");
    mystr.gsub!(/RhU/,"ढ़ू");
    mystr.gsub!(/Rha/,"ढ़");

    mystr.gsub!(/Roo/,"ड़ू");
    mystr.gsub!(/Ruu/,"ड़ू");
    mystr.gsub!(/Rau/,"ड़ौ");
    mystr.gsub!(/Rai/,"ड़ै");
    mystr.gsub!(/Ru/,"ड़ु");
    mystr.gsub!(/Ree/,"ड़ी");
    mystr.gsub!(/Re/,"ड़े");
    mystr.gsub!(/Rii/,"ड़ि");
    mystr.gsub!(/Ri/,"ड़ि");
    mystr.gsub!(/Raa/,"ड़ा");
    mystr.gsub!(/Ro/,"ड़ो");
    mystr.gsub!(/RA/,"ड़ा");
    mystr.gsub!(/RI/,"ड़ी");
    mystr.gsub!(/RU/,"ड़ू");
    mystr.gsub!(/Ra/,"ड़");


    mystr.gsub!(/\.Do/,"ड़ो");
    mystr.gsub!(/\.Du/,"ड़ु");
##    mystr.gsub!(/\.Dh/,"ढ़्");
    mystr.gsub!(/\.De/,"ड़े");
    mystr.gsub!(/\.Di/,"ड़ि");
    mystr.gsub!(/\.DA/,"ड़ा");
    mystr.gsub!(/\.DI/,"ड़ी");
    mystr.gsub!(/\.DU/,"ड़ू");
    mystr.gsub!(/\.Da/,"ड़");
    mystr.gsub!(/Cho/,"छो");
    mystr.gsub!(/Chu/,"छु");
    mystr.gsub!(/Che/,"छे");
    mystr.gsub!(/Chi/,"छि");
    mystr.gsub!(/ChA/,"छा");
    mystr.gsub!(/ChI/,"छी");
    mystr.gsub!(/ChU/,"छू");
    mystr.gsub!(/Cha/,"छ");
    mystr.gsub!(/Tho/,"ठो");
    mystr.gsub!(/Thu/,"ठु");
    mystr.gsub!(/The/,"ठे");
    mystr.gsub!(/Thi/,"ठि");
    mystr.gsub!(/ThU/,"ठू");
    mystr.gsub!(/Tha/,"ठ");
    mystr.gsub!(/b\.h/,"ब्‌");
    mystr.gsub!(/bii/,"बी");
    mystr.gsub!(/bee/,"बी");
    mystr.gsub!(/bai/,"बै");
    mystr.gsub!(/bau/,"बौ");
    mystr.gsub!(/bhU/,"भू");
    mystr.gsub!(/bha/,"भ");
    mystr.gsub!(/ShA/,"षा");
    mystr.gsub!(/She/,"षे");
    mystr.gsub!(/Shi/,"षि");
    mystr.gsub!(/ShU/,"षू");
    mystr.gsub!(/Sha/,"ष");
    mystr.gsub!(/Naa/,"णा");
    mystr.gsub!(/T\.h/,"ट्‌");
    mystr.gsub!(/Sho/,"षो");
    mystr.gsub!(/Shu/,"षु");
    mystr.gsub!(/ShI/,"षी");
    mystr.gsub!(/Taa/,"टा");
    mystr.gsub!(/Tai/,"टै");
    mystr.gsub!(/Tau/,"टौ");
    mystr.gsub!(/ThA/,"ठा");
    mystr.gsub!(/ThI/,"ठी");
    mystr.gsub!(/Tee/,"टी");
    mystr.gsub!(/Too/,"टू");
    mystr.gsub!(/Tii/,"टी");
    mystr.gsub!(/Tuu/,"टू");
    mystr.gsub!(/cho/,"चो");
    mystr.gsub!(/chu/,"चु");
    mystr.gsub!(/caa/,"चा");
    mystr.gsub!(/che/,"चे");
    mystr.gsub!(/chi/,"चि");
    mystr.gsub!(/chA/,"चा");
    mystr.gsub!(/chI/,"ची");
    mystr.gsub!(/Cii/,"ची");
    mystr.gsub!(/Cuu/,"चू");
    mystr.gsub!(/Cee/,"ची");
    mystr.gsub!(/Coo/,"चू");
    mystr.gsub!(/chU/,"चू");
    mystr.gsub!(/cha/,"च");
    mystr.gsub!(/bho/,"भो");
    mystr.gsub!(/bhu/,"भु");
    mystr.gsub!(/bhe/,"भे");
    mystr.gsub!(/bhi/,"भि");
    mystr.gsub!(/bhA/,"भा");
    mystr.gsub!(/buu/,"बू");
    mystr.gsub!(/boo/,"बू");
    mystr.gsub!(/baa/,"बा");
    mystr.gsub!(/bhI/,"भी");
    mystr.gsub!(/C\.h/,"च्‌");
    mystr.gsub!(/Cai/,"चै");
    mystr.gsub!(/Cau/,"चौ");
    mystr.gsub!(/dny/,"ज्ञ्");
    mystr.gsub!(/dho/,"धो");
    mystr.gsub!(/dhu/,"धु");
    mystr.gsub!(/dhe/,"धे");
    mystr.gsub!(/dhi/,"धि");
    mystr.gsub!(/dhA/,"धा");
    mystr.gsub!(/dhI/,"धी");
    mystr.gsub!(/dee/,"दी");
    mystr.gsub!(/doo/,"दू");
    mystr.gsub!(/dii/,"दी");
    mystr.gsub!(/duu/,"दू");
    mystr.gsub!(/dhU/,"धू");
    mystr.gsub!(/dha/,"ध");
    mystr.gsub!(/d\.h/,"द्‌");
##    mystr.gsub!(/chh\s/,"छ ");
##    mystr.gsub!(/chh_/,"छ");
    mystr.gsub!(/daa/,"दा");
    mystr.gsub!(/dai/,"दै");
    mystr.gsub!(/dau/,"दौ");
    mystr.gsub!(/ldo/,"ल्दो");
    mystr.gsub!(/ldu/,"ल्दु");
    mystr.gsub!(/lde/,"ल्दे");
    mystr.gsub!(/ldi/,"ल्दि");
    mystr.gsub!(/ldA/,"ल्दा");
    mystr.gsub!(/luu/,"लू");
    mystr.gsub!(/loo/,"लू");
    mystr.gsub!(/laa/,"ला");
    mystr.gsub!(/ldI/,"ल्दी");
    mystr.gsub!(/lii/,"ली");
    mystr.gsub!(/lee/,"ली");
    mystr.gsub!(/lai/,"लै");
    mystr.gsub!(/lau/,"लौ");
    mystr.gsub!(/ldU/,"ल्दू");
    mystr.gsub!(/lda/,"ल्द");
    mystr.gsub!(/n\.h/,"न्‌");
    mystr.gsub!(/mee/,"मी");
    mystr.gsub!(/moo/,"मू");
    mystr.gsub!(/mii/,"मी");
    mystr.gsub!(/muu/,"मू");
    mystr.gsub!(/m\.h/,"म्‌");
    mystr.gsub!(/mai/,"मै");
    mystr.gsub!(/mau/,"मौ");
    mystr.gsub!(/l\.h/,"ल्‌");
    mystr.gsub!(/kho/,"खो");
    mystr.gsub!(/khu/,"खु");
    mystr.gsub!(/kaa/,"का");
    mystr.gsub!(/khe/,"खे");
    mystr.gsub!(/khi/,"खि");
    mystr.gsub!(/khA/,"खा");
    mystr.gsub!(/khI/,"खी");
    mystr.gsub!(/khU/,"खू");
    mystr.gsub!(/kha/,"ख");
    mystr.gsub!(/k\.h/,"क्‌");
    mystr.gsub!(/jho/,"झो");
    mystr.gsub!(/jhu/,"झु");
    mystr.gsub!(/jhe/,"झे");
    mystr.gsub!(/jhi/,"झि");
    mystr.gsub!(/jaa/,"जा");
    mystr.gsub!(/jhI/,"झी");
    mystr.gsub!(/kai/,"कै");
    mystr.gsub!(/kau/,"कौ");
    mystr.gsub!(/kee/,"की");
    mystr.gsub!(/koo/,"कू");
    mystr.gsub!(/kii/,"की");
    mystr.gsub!(/kuu/,"कू");
    mystr.gsub!(/h\.h/,"ह्‌");
    mystr.gsub!(/gho/,"घो");
    mystr.gsub!(/ghu/,"घु");
    mystr.gsub!(/ghe/,"घे");
    mystr.gsub!(/ghi/,"घि");
    mystr.gsub!(/ghA/,"घा");
    mystr.gsub!(/ghI/,"घी");
    mystr.gsub!(/haa/,"हा");
    mystr.gsub!(/hii/,"ही");
    mystr.gsub!(/hee/,"ही");
    mystr.gsub!(/hai/,"है");
    mystr.gsub!(/hau/,"हौ");
    mystr.gsub!(/jai/,"जै");
    mystr.gsub!(/jau/,"जौ");
    mystr.gsub!(/hoo/,"हू");
    mystr.gsub!(/huu/,"हू");
    mystr.gsub!(/j\.h/,"ज्‌");
    mystr.gsub!(/jhA/,"झा");
    mystr.gsub!(/joo/,"जू");
    mystr.gsub!(/jee/,"जी");
    mystr.gsub!(/juu/,"जू");
    mystr.gsub!(/jii/,"जी");
    mystr.gsub!(/jhU/,"झू");
    mystr.gsub!(/jha/,"झ");
    mystr.gsub!(/f\.h/,"फ़्‌");
    mystr.gsub!(/fii/,"फ़ी");
    mystr.gsub!(/fai/,"फ़ै");
    mystr.gsub!(/fau/,"फ़ौ");
    mystr.gsub!(/faa/,"फ़ा");
    mystr.gsub!(/gaa/,"गा");
    mystr.gsub!(/foo/,"फ़ू");
    mystr.gsub!(/fuu/,"फ़ू");
    mystr.gsub!(/g\.h/,"ग्‌");
    mystr.gsub!(/ghU/,"घू");
    mystr.gsub!(/gha/,"घ");
    mystr.gsub!(/gai/,"गै");
    mystr.gsub!(/gau/,"गौ");
    mystr.gsub!(/gee/,"गी");
    mystr.gsub!(/goo/,"गू");
    mystr.gsub!(/gii/,"गी");
    mystr.gsub!(/guu/,"गू");
    mystr.gsub!(/q\.h/,"क़्‌");
    mystr.gsub!(/pho/,"फो");
    mystr.gsub!(/phu/,"फु");
    mystr.gsub!(/phe/,"फे");
    mystr.gsub!(/phi/,"फि");
    mystr.gsub!(/paa/,"पा");
    mystr.gsub!(/phI/,"फी");
    mystr.gsub!(/phU/,"फू");
    mystr.gsub!(/pha/,"फ");
    mystr.gsub!(/nai/,"नै");
    mystr.gsub!(/nau/,"नौ");
    mystr.gsub!(/maa/,"मा");
    mystr.gsub!(/naa/,"ना");
    mystr.gsub!(/nee/,"नी");
    mystr.gsub!(/nii/,"नी");
    mystr.gsub!(/phA/,"फा");
    mystr.gsub!(/poo/,"पू");
    mystr.gsub!(/pee/,"पी");
    mystr.gsub!(/puu/,"पू");
    mystr.gsub!(/pii/,"पी");
    mystr.gsub!(/pai/,"पै");
    mystr.gsub!(/pau/,"पौ");
    mystr.gsub!(/noo/,"नू");
    mystr.gsub!(/nuu/,"नू");
    mystr.gsub!(/p\.h/,"प्‌");
    mystr.gsub!(/qai/,"क़ै");
    mystr.gsub!(/qau/,"क़ौ");
    mystr.gsub!(/qee/,"क़ी");
    mystr.gsub!(/qoo/,"क़ू");
    mystr.gsub!(/qii/,"क़ी");
    mystr.gsub!(/quu/,"क़ू");
    mystr.gsub!(/r\.h/,"र्‌");
    mystr.gsub!(/rai/,"रै");
    mystr.gsub!(/rau/,"रौ");
    mystr.gsub!(/qaa/,"क़ा");
    mystr.gsub!(/raa/,"रा");
    mystr.gsub!(/ree/,"री");
    mystr.gsub!(/rii/,"री");
    mystr.gsub!(/roo/,"रू");
    mystr.gsub!(/ruu/,"रू");
    mystr.gsub!(/s\.h/,"स्‌");
    mystr.gsub!(/see/,"सी");
    mystr.gsub!(/sii/,"सी");
    mystr.gsub!(/sai/,"सै");
    mystr.gsub!(/sau/,"सौ");
    mystr.gsub!(/shA/,"शा");
    mystr.gsub!(/soo/,"सू");
    mystr.gsub!(/suu/,"सू");
    mystr.gsub!(/saa/,"सा");
    mystr.gsub!(/shI/,"शी");
    mystr.gsub!(/shU/,"शू");
    mystr.gsub!(/sha/,"श");
    mystr.gsub!(/thA/,"था");
    mystr.gsub!(/too/,"तू");
    mystr.gsub!(/tuu/,"तू");
    mystr.gsub!(/the/,"थे");
    mystr.gsub!(/thi/,"थि");
    mystr.gsub!(/thU/,"थू");
    mystr.gsub!(/tha/,"थ");
    mystr.gsub!(/taa/,"ता");
    mystr.gsub!(/tee/,"ती");
    mystr.gsub!(/tii/,"ती");
    mystr.gsub!(/tai/,"तै");
    mystr.gsub!(/tau/,"तौ");
    mystr.gsub!(/sho/,"शो");
    mystr.gsub!(/shu/,"शु");
    mystr.gsub!(/she/,"शे");
    mystr.gsub!(/shi/,"शि");
    mystr.gsub!(/t\.h/,"त्‌");
    mystr.gsub!(/v\.h/,"व्‌");
    mystr.gsub!(/tho/,"थो");
    mystr.gsub!(/thu/,"थु");
    mystr.gsub!(/thI/,"थी");
    mystr.gsub!(/w\.h/,"व्‌");
    mystr.gsub!(/vee/,"वी");
    mystr.gsub!(/voo/,"वू");
    mystr.gsub!(/vii/,"वी");
    mystr.gsub!(/vuu/,"वू");
    mystr.gsub!(/vaa/,"वा");
    mystr.gsub!(/vai/,"वै");
    mystr.gsub!(/vau/,"वौ");
    mystr.gsub!(/wai/,"वै");
    mystr.gsub!(/wau/,"वौ");
    mystr.gsub!(/wee/,"वी");
    mystr.gsub!(/wii/,"वी");
    mystr.gsub!(/woo/,"वू");
    mystr.gsub!(/wuu/,"वू");
    mystr.gsub!(/x\.h/,"क्ष्‌");
    mystr.gsub!(/xai/,"क्षै");
    mystr.gsub!(/xau/,"क्षौ");

##two chars
    mystr.gsub!(/xe/,"क्षे");
    mystr.gsub!(/xi/,"क्षि");
    mystr.gsub!(/xA/,"क्षा");
    mystr.gsub!(/xI/,"क्षी");
    mystr.gsub!(/xU/,"क्षू");
    mystr.gsub!(/xa/,"क्ष");
    mystr.gsub!(/wo/,"वो");
    mystr.gsub!(/wu/,"वु");
    mystr.gsub!(/we/,"वे");
    mystr.gsub!(/wi/,"वि");
    mystr.gsub!(/wU/,"वू");
    mystr.gsub!(/wa/,"व");
    mystr.gsub!(/ve/,"वे");
    mystr.gsub!(/vi/,"वि");
    mystr.gsub!(/vI/,"वी");
    mystr.gsub!(/vo/,"वो");
    mystr.gsub!(/vu/,"वु");
    mystr.gsub!(/wA/,"वा");
    mystr.gsub!(/wI/,"वी");
    mystr.gsub!(/vA/,"वा");
    mystr.gsub!(/vU/,"वू");
    mystr.gsub!(/va/,"व");
    mystr.gsub!(/tA/,"ता");
    mystr.gsub!(/tI/,"ती");
    mystr.gsub!(/te/,"ते");
    mystr.gsub!(/ti/,"ति");
    mystr.gsub!(/to/,"तो");
    mystr.gsub!(/tu/,"तु");
    mystr.gsub!(/tU/,"तू");
    mystr.gsub!(/ta/,"त");
    mystr.gsub!(/se/,"से");
    mystr.gsub!(/si/,"सि");
    mystr.gsub!(/so/,"सो");
    mystr.gsub!(/su/,"सु");
    mystr.gsub!(/sI/,"सी");
    mystr.gsub!(/sU/,"सू");
    mystr.gsub!(/sa/,"स");
    mystr.gsub!(/sA/,"सा");
    mystr.gsub!(/ro/,"रो");
    mystr.gsub!(/ru/,"रु");
    mystr.gsub!(/re/,"रे");
    mystr.gsub!(/ri/,"रि");
    mystr.gsub!(/rA/,"रा");
    mystr.gsub!(/rI/,"री");
    mystr.gsub!(/qo/,"क़ो");
    mystr.gsub!(/qu/,"क़ु");
    mystr.gsub!(/qe/,"क़े");
    mystr.gsub!(/qi/,"क़ि");
    mystr.gsub!(/rU/,"रू");
    mystr.gsub!(/ra/,"र");
    mystr.gsub!(/pA/,"पा");
    mystr.gsub!(/pe/,"पे");
    mystr.gsub!(/pi/,"पि");
    mystr.gsub!(/po/,"पो");
    mystr.gsub!(/pu/,"पु");
    mystr.gsub!(/pI/,"पी");
    mystr.gsub!(/no/,"नो");
    mystr.gsub!(/nu/,"नु");
    mystr.gsub!(/ne/,"ने");
    mystr.gsub!(/ni/,"नि");
    mystr.gsub!(/pU/,"पू");
    mystr.gsub!(/pa/,"प");
    mystr.gsub!(/qA/,"क़ा");
    mystr.gsub!(/qI/,"क़ी");
    mystr.gsub!(/qU/,"क़ू");
    mystr.gsub!(/qa/,"क़");
    mystr.gsub!(/go/,"गो");
    mystr.gsub!(/gu/,"गु");
    mystr.gsub!(/ge/,"गे");
    mystr.gsub!(/gi/,"गि");
    mystr.gsub!(/gA/,"गा");
    mystr.gsub!(/gI/,"गी");
    mystr.gsub!(/gU/,"गू");
    mystr.gsub!(/ga/,"ग");
    mystr.gsub!(/fe/,"फ़े");
    mystr.gsub!(/fi/,"फ़ि");
    mystr.gsub!(/fo/,"फ़ो");
    mystr.gsub!(/fu/,"फ़ु");
    mystr.gsub!(/fI/,"फ़ी");
    mystr.gsub!(/fU/,"फ़ू");
    mystr.gsub!(/fa/,"फ़");
    mystr.gsub!(/fA/,"फ़ा");
    mystr.gsub!(/jo/,"जो");
    mystr.gsub!(/ju/,"जु");
    mystr.gsub!(/jI/,"जी");
    mystr.gsub!(/jA/,"जा");
    mystr.gsub!(/je/,"जे");
    mystr.gsub!(/ji/,"जि");
    mystr.gsub!(/jU/,"जू");
    mystr.gsub!(/ja/,"ज");

    mystr.gsub!(/Khe/,"ख़े");
    mystr.gsub!(/Ke/,"ख़े");
    mystr.gsub!(/Khi/,"ख़ि");
    mystr.gsub!(/Ki/,"ख़ि");
    mystr.gsub!(/Kho/,"ख़ो");
    mystr.gsub!(/Ko/,"ख़ो");
    mystr.gsub!(/Khu/,"ख़ु");
    mystr.gsub!(/Ku/,"ख़ु");
    mystr.gsub!(/KhI/,"ख़ी");
    mystr.gsub!(/KI/,"ख़ी");
    mystr.gsub!(/KhU/,"ख़ू");
    mystr.gsub!(/KU/,"ख़ू");
    mystr.gsub!(/Kha/,"ख़");
    mystr.gsub!(/Ka/,"ख़");
    mystr.gsub!(/KhA/,"ख़ा");
    mystr.gsub!(/KA/,"ख़ा");

    mystr.gsub!(/he/,"हे");
    mystr.gsub!(/hi/,"हि");
    mystr.gsub!(/ho/,"हो");
    mystr.gsub!(/hu/,"हु");
    mystr.gsub!(/hU/,"हू");
    mystr.gsub!(/ha/,"ह");
    mystr.gsub!(/hA/,"हा");
    mystr.gsub!(/hI/,"ही");
    mystr.gsub!(/ko/,"को");
    mystr.gsub!(/ku/,"कु");
    mystr.gsub!(/ke/,"के");
    mystr.gsub!(/ki/,"कि");
    mystr.gsub!(/kU/,"कू");
    mystr.gsub!(/ka/,"क");
    mystr.gsub!(/kA/,"का");
    mystr.gsub!(/kI/,"की");
    mystr.gsub!(/lA/,"ला");
    mystr.gsub!(/lU/,"लू");
    mystr.gsub!(/la/,"ल");
    mystr.gsub!(/me/,"मे");
    mystr.gsub!(/mi/,"मि");
    mystr.gsub!(/mA/,"मा");
    mystr.gsub!(/mI/,"मी");
    mystr.gsub!(/mU/,"मू");
    mystr.gsub!(/ma/,"म");
    mystr.gsub!(/mo/,"मो");
    mystr.gsub!(/mu/,"मु");
    mystr.gsub!(/nA/,"ना");
    mystr.gsub!(/nI/,"नी");
    mystr.gsub!(/nU/,"नू");
    mystr.gsub!(/na/,"न");
    mystr.gsub!(/le/,"ले");
    mystr.gsub!(/li/,"लि");
    mystr.gsub!(/lo/,"लो");
    mystr.gsub!(/lu/,"लु");
    mystr.gsub!(/lI/,"ली");
    mystr.gsub!(/de/,"दे");
    mystr.gsub!(/di/,"दि");
    mystr.gsub!(/dI/,"दी");
    mystr.gsub!(/dU/,"दू");
    mystr.gsub!(/da/,"द");
    mystr.gsub!(/dA/,"दा");
    mystr.gsub!(/do/,"दो");
    mystr.gsub!(/du/,"दु");
    mystr.gsub!(/Ce/,"चे");
    mystr.gsub!(/Ci/,"चि");
    mystr.gsub!(/CA/,"चा");
    mystr.gsub!(/CI/,"ची");
    mystr.gsub!(/CU/,"चू");
    mystr.gsub!(/Ca/,"च");
##    mystr.gsub!(/ch/,"च्");
    mystr.gsub!(/Co/,"चो");
    mystr.gsub!(/Cu/,"चु");
    mystr.gsub!(/To/,"टो");
    mystr.gsub!(/Tu/,"टु");
    mystr.gsub!(/Te/,"टे");
    mystr.gsub!(/Ti/,"टि");
    mystr.gsub!(/TI/,"टी");
    mystr.gsub!(/TA/,"टा");
    mystr.gsub!(/TU/,"टू");
    mystr.gsub!(/Ta/,"ट");
    mystr.gsub!(/be/,"बे");
    mystr.gsub!(/bi/,"बि");
    mystr.gsub!(/bo/,"बो");
    mystr.gsub!(/bu/,"बु");
    mystr.gsub!(/bI/,"बी");
    mystr.gsub!(/bA/,"बा");
    mystr.gsub!(/bU/,"बू");
    mystr.gsub!(/ba/,"ब");
##    mystr.gsub!(/\.D/,"ड़्");

    mystr.gsub!(/Do/,"डो");
    mystr.gsub!(/Du/,"डु");
    mystr.gsub!(/De/,"डे");
    mystr.gsub!(/Di/,"डि");
    mystr.gsub!(/DA/,"डा");
    mystr.gsub!(/DI/,"डी");
    mystr.gsub!(/DU/,"डू");
    mystr.gsub!(/Da/,"ड");
    mystr.gsub!(/Ge/,"ग़े");
    mystr.gsub!(/Gi/,"ग़ि");
    mystr.gsub!(/GA/,"ग़ा");
    mystr.gsub!(/Go/,"ग़ो");
    mystr.gsub!(/Gu/,"ग़ु");
    mystr.gsub!(/GI/,"ग़ी");
    mystr.gsub!(/GU/,"ग़ू");
    mystr.gsub!(/Ga/,"ग़");
    mystr.gsub!(/No/,"णो");
    mystr.gsub!(/Nu/,"णु");
    mystr.gsub!(/Ne/,"णे");
    mystr.gsub!(/Ni/,"णि");
    mystr.gsub!(/NA/,"णा");
    mystr.gsub!(/NI/,"णी");
    mystr.gsub!(/Lo/,"ळो");
    mystr.gsub!(/Lu/,"ळु");
    mystr.gsub!(/Le/,"ळे");
    mystr.gsub!(/Li/,"ळि");
    mystr.gsub!(/NU/,"णू");
    mystr.gsub!(/Na/,"ण");
    mystr.gsub!(/LA/,"ळा");
    mystr.gsub!(/LI/,"ळी");
    mystr.gsub!(/LU/,"ळू");
    mystr.gsub!(/La/,"ळ");
    mystr.gsub!(/JA/,"ज़ा");
    mystr.gsub!(/JI/,"ज़ी");
    mystr.gsub!(/JU/,"ज़ू");
    mystr.gsub!(/Ja/,"ज़");
##    mystr.gsub!(/JN/,"ञ्");
    mystr.gsub!(/Jo/,"ज़ो");
    mystr.gsub!(/Ju/,"ज़ु");
    mystr.gsub!(/Je/,"ज़े");
    mystr.gsub!(/Ji/,"ज़ि");

    mystr.gsub!(/ye/,"ये");
    mystr.gsub!(/yi/,"यि");
    mystr.gsub!(/yo/,"यो");
    mystr.gsub!(/yu/,"यु");
    mystr.gsub!(/yI/,"यी");
    mystr.gsub!(/zU/,"ज़ू");
    mystr.gsub!(/za/,"ज़");
    mystr.gsub!(/yA/,"या");
    mystr.gsub!(/xo/,"क्षो");
    mystr.gsub!(/xu/,"क्षु");
    mystr.gsub!(/yU/,"यू");
    mystr.gsub!(/ya/,"य");
    mystr.gsub!(/~N/,"ङ्");
    mystr.gsub!(/zo/,"ज़ो");
    mystr.gsub!(/zu/,"ज़ु");
    mystr.gsub!(/ze/,"ज़े");
    mystr.gsub!(/zi/,"ज़ि");
    mystr.gsub!(/zA/,"ज़ा");
    mystr.gsub!(/zI/,"ज़ी");
    mystr.gsub!(/~n/,"ञ्");
    mystr.gsub!(/aa/,"आ");
    mystr.gsub!(/OM/,"ॐ");
    mystr.gsub!(/au/,"औ");
    mystr.gsub!(/ee/,"ई");
    mystr.gsub!(/ii/,"ई");
    mystr.gsub!(/oo/,"ऊ");
    mystr.gsub!(/uu/,"ऊ");
    mystr.gsub!(/ai/,"ऐ");

##1 char
##    mystr.gsub!(/0/,"०");
##    mystr.gsub!(/1/,"१");
##    mystr.gsub!(/2/,"२");
##    mystr.gsub!(/3/,"३");
##    mystr.gsub!(/4/,"४");
##    mystr.gsub!(/5/,"५");
##    mystr.gsub!(/6/,"६");
##    mystr.gsub!(/7/,"७");
##    mystr.gsub!(/8/,"८");
##    mystr.gsub!(/9/,"९");

    mystr.gsub!(/u/,"उ");
    mystr.gsub!(/U/,"ऊ");
    mystr.gsub!(/o/,"ओ");
    mystr.gsub!(/M/,"ं");
    mystr.gsub!(/H/,"ः");
    mystr.gsub!(/i/,"इ");
    mystr.gsub!(/I/,"ई");
    mystr.gsub!(/a/,"अ");
    mystr.gsub!(/A/,"आ");
    mystr.gsub!(/e/,"ए");
    mystr.gsub!(/~/,"ऽ");
##    mystr.gsub!(/;/,"॥");

##if half-chracters are followed by then write that full letter (without halant) and the preceding symbol.

##    mystr.gsub!(/shh\s/,"ष ");
    mystr.gsub!(/\.Dh([\s\-\]\*\)\,\.\:\_\{\}\?\\])/) { "ढ़#{$1}" };
    mystr.gsub!(/\.D([\s\-\]\*\)\,\.\:\_\{\}\?\\])/) { "ड़#{$1}" };
    mystr.gsub!(/\Rh([\s\-\]\*\)\,\.\:\_\{\}\?\\])/) { "ढ़#{$1}" };
    mystr.gsub!(/\R([\s\-\]\*\)\,\.\:\_\{\}\?\\])/) { "ड़#{$1}" };
    mystr.gsub!(/shh([\s\-\]\*\)\,\.\:\_\{\}\?\\])/) { "ष#{$1}" };
    mystr.gsub!(/chh([\s\-\]\*\)\,\.\:\_\{\}\?\\])/) { "छ#{$1}" };
    mystr.gsub!(/JN([\s\-\]\*\)\,\.\:\_\{\}\?\\])/) { "ज्ञ#{$1}" };
    mystr.gsub!(/GY([\s\-\]\*\)\,\.\:\_\{\}\?\\])/) { "ज्ञ#{$1}" };
    mystr.gsub!(/kh([\s\-\]\*\)\,\.\:\_\{\}\?\\])/) { "ख#{$1}" };
    mystr.gsub!(/Kh([\s\-\]\*\)\,\.\:\_\{\}\?\\])/) { "ख़#{$1}" };
    mystr.gsub!(/gh([\s\-\]\*\)\,\.\:\_\{\}\?\\])/) { "घ#{$1}" };
    mystr.gsub!(/Gh([\s\-\]\*\)\,\.\:\_\{\}\?\\])/) { "ग़#{$1}" };
    mystr.gsub!(/ch([\s\-\]\*\)\,\.\:\_\{\}\?\\])/) { "च#{$1}" };
    mystr.gsub!(/jh([\s\-\]\*\)\,\.\:\_\{\}\?\\])/) { "झ#{$1}" };
    mystr.gsub!(/th([\s\-\]\*\)\,\.\:\_\{\}\?\\])/) { "थ#{$1}" };
    mystr.gsub!(/dh([\s\-\]\*\)\,\.\:\_\{\}\?\\])/) { "ध#{$1}" };
    mystr.gsub!(/Th([\s\-\]\*\)\,\.\:\_\{\}\?\\])/) { "ठ#{$1}" };
    mystr.gsub!(/Dh([\s\-\]\*\)\,\.\:\_\{\}\?\\])/) { "ढ#{$1}" };
    mystr.gsub!(/ph([\s\-\]\*\)\,\.\:\_\{\}\?\\])/) { "फ#{$1}" };
    mystr.gsub!(/bh([\s\-\]\*\)\,\.\:\_\{\}\?\\])/) { "भ#{$1}" };
    mystr.gsub!(/sh([\s\-\]\*\)\,\.\:\_\{\}\?\\])/) { "श#{$1}" };
    mystr.gsub!(/Sh([\s\-\]\*\)\,\.\:\_\{\}\?\\])/) { "ष#{$1}" };
    mystr.gsub!(/z([\s\-\]\*\)\,\.\:\_\{\}\?\\])/) { "ज़#{$1}" };
    mystr.gsub!(/y([\s\-\]\*\)\,\.\:\_\{\}\?\\])/) { "य#{$1}" };
    mystr.gsub!(/K([\s\-\]\*\)\,\.\:\_\{\}\?\\])/) { "ख़#{$1}" };
    mystr.gsub!(/J([\s\-\]\*\)\,\.\:\_\{\}\?\\])/) { "ज़#{$1}" };
    mystr.gsub!(/L([\s\-\]\*\)\,\.\:\_\{\}\?\\])/) { "ळ#{$1}" };
    mystr.gsub!(/N([\s\-\]\*\)\,\.\:\_\{\}\?\\])/) { "ण#{$1}" };
    mystr.gsub!(/G([\s\-\]\*\)\,\.\:\_\{\}\?\\])/) { "ग़#{$1}" };
    mystr.gsub!(/D([\s\-\]\*\)\,\.\:\_\{\}\?\\])/) { "ड#{$1}" };
    mystr.gsub!(/b([\s\-\]\*\)\,\.\:\_\{\}\?\\])/) { "ब#{$1}" };
    mystr.gsub!(/T([\s\-\]\*\)\,\.\:\_\{\}\?\\])/) { "ट#{$1}" };
    mystr.gsub!(/C([\s\-\]\*\)\,\.\:\_\{\}\?\\])/) { "च#{$1}" };
    mystr.gsub!(/d([\s\-\]\*\)\,\.\:\_\{\}\?\\])/) { "द#{$1}" };
    mystr.gsub!(/m([\s\-\]\*\)\,\.\:\_\{\}\?\\])/) { "म#{$1}" };
    mystr.gsub!(/n([\s\-\]\*\)\,\.\:\_\{\}\?\\])/) { "न#{$1}" };
    mystr.gsub!(/l([\s\-\]\*\)\,\.\:\_\{\}\?\\])/) { "ल#{$1}" };
    mystr.gsub!(/k([\s\-\]\*\)\,\.\:\_\{\}\?\\])/) { "क#{$1}" };
    mystr.gsub!(/h([\s\-\]\*\)\,\.\:\_\{\}\?\\])/) { "ह#{$1}" };
    mystr.gsub!(/j([\s\-\]\*\)\,\.\:\_\{\}\?\\])/) { "ज#{$1}" };
    mystr.gsub!(/f([\s\-\]\*\)\,\.\:\_\{\}\?\\])/) { "फ़#{$1}" };
    mystr.gsub!(/g([\s\-\]\*\)\,\.\:\_\{\}\?\\])/) { "ग#{$1}" };
    mystr.gsub!(/q([\s\-\]\*\)\,\.\:\_\{\}\?\\])/) { "क़#{$1}" };
    mystr.gsub!(/p([\s\-\]\*\)\,\.\:\_\{\}\?\\])/) { "प#{$1}" };
    mystr.gsub!(/r([\s\-\]\*\)\,\.\:\_\{\}\?\\])/) { "र#{$1}" };
    mystr.gsub!(/s([\s\-\]\*\)\,\.\:\_\{\}\?\\])/) { "स#{$1}" };
    mystr.gsub!(/t([\s\-\]\*\)\,\.\:\_\{\}\?\\])/) { "त#{$1}" };
    mystr.gsub!(/v([\s\-\]\*\)\,\.\:\_\{\}\?\\])/) { "व#{$1}" };
    mystr.gsub!(/w([\s\-\]\*\)\,\.\:\_\{\}\?\\])/) { "व#{$1}" };
    mystr.gsub!(/x([\s\-\]\*\)\,\.\:\_\{\}\?\\])/) { "क्ष#{$1}" };

##half consonants
    mystr.gsub!(/shh/,"ष्");
    mystr.gsub!(/chh/,"छ्");
    mystr.gsub!(/JN/,"ज्ञ्");
    mystr.gsub!(/GY/,"ज्ञ्");
    mystr.gsub!(/kh/,"ख्");
    mystr.gsub!(/Kh/,"ख़्");
    mystr.gsub!(/gh/,"घ्");
    mystr.gsub!(/ch/,"च्");
    mystr.gsub!(/jh/,"झ्");
    mystr.gsub!(/th/,"थ्");
    mystr.gsub!(/dh/,"ध्");
    mystr.gsub!(/Th/,"ठ्");
    mystr.gsub!(/Dh/,"ढ्");
    mystr.gsub!(/ph/,"फ्");
    mystr.gsub!(/bh/,"भ्");
    mystr.gsub!(/sh/,"श्");
    mystr.gsub!(/Sh/,"ष्");
    mystr.gsub!(/z/,"ज़्");
    mystr.gsub!(/y/,"य्");
    mystr.gsub!(/K/,"ख़्");
    mystr.gsub!(/J/,"ज़्");
    mystr.gsub!(/L/,"ळ्");
    mystr.gsub!(/N/,"ण्");
    mystr.gsub!(/G/,"ग़्");
    mystr.gsub!(/D/,"ड्");
    mystr.gsub!(/b/,"ब्");
    mystr.gsub!(/T/,"ट्");
    mystr.gsub!(/C/,"च्");
    mystr.gsub!(/d/,"द्");
    mystr.gsub!(/m/,"म्");
    mystr.gsub!(/n/,"न्");
    mystr.gsub!(/l/,"ल्");
    mystr.gsub!(/k/,"क्");
    mystr.gsub!(/h/,"ह्");
    mystr.gsub!(/j/,"ज्");
    mystr.gsub!(/f/,"फ़्");
    mystr.gsub!(/g/,"ग्");
    mystr.gsub!(/q/,"क़्");
    mystr.gsub!(/p/,"प्");
    mystr.gsub!(/r/,"र्");
    mystr.gsub!(/s/,"स्");
    mystr.gsub!(/t/,"त्");
    mystr.gsub!(/v/,"व्");
    mystr.gsub!(/w/,"व्");
    mystr.gsub!(/x/,"क्ष्");

    mystr.gsub!(/\$([^$]*)\$/) { eval($1).pack('c*') };

    mystr.gsub!(/_/,"");
    mystr.gsub!(/\*/,"॰"); 
    mystr.gsub!(/\{\}/,"");
    mystr.gsub!(/\|/,"।");

    mystr;
  end

end
