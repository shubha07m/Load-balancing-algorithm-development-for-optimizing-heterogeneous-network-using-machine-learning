setwd("E:/shubh_projects")
netdata = read.csv("fake_raw_data.csv")

#for lte DL

ltdlmean = mean(netdata$DownLinklte)
ltdl = ifelse(netdata$DownLinklte > ltdlmean,"Yes","No")

# for wifi DL


wifidlmean = mean(netdata$DownLinkwifi)
wifidl = ifelse(netdata$DownLinkwifi > wifidlmean, "Yes","No")

# for lte UL


ltulmean = mean(netdata$UpLinklte)
ltul = ifelse(netdata$UpLinklte > ltulmean, "Yes","No")

# for wifi UL


wifiulmean = mean(netdata$UpLinkwifi)
wifiul= ifelse(netdata$UpLinkwifi > wifiulmean,"Yes","No")


# for lte latency


ltlatmean = mean(netdata$Latencylte)
ltlat= ifelse(netdata$Latencylte < ltlatmean,"Yes","No")

# for wifi latency


wifilatmean = mean(netdata$Latencywifi)
wifilat=ifelse(netdata$Latencywifi < wifilatmean,"Yes","No")


# for lte reliablity:


ltsigmean = mean(netdata$Signallte)
ltlsig=ifelse(netdata$Signallte > ltsigmean,"Yes","No")

# for wifi reliablity


wifisigmean = mean(netdata$Signalwifi)
wifisig= ifelse(netdata$Signalwifi > wifisigmean, "Yes","No")



# adding newly created rows and displaying
newnet = data.frame(netdata,ltdl,wifidl,ltul,wifiul,ltlat,wifilat,ltlsig,wifisig)
nexnet = newnet[,12:19]
fix(nexnet)