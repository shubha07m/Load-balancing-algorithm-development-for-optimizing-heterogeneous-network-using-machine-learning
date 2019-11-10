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
ltsig=ifelse(netdata$Signallte > ltsigmean,"Yes","No")

# for wifi reliablity


wifisigmean = mean(netdata$Signalwifi)
wifisig= ifelse(netdata$Signalwifi > wifisigmean, "Yes","No")



# adding newly created rows and displaying
newnet = data.frame(netdata,ltdl,wifidl,ltul,wifiul,ltlat,wifilat,ltsig,wifisig)
nexnet = newnet[,12:19]



### Step by step deduction


# for downlink decision

dldecision = rep('No need to handover',nrow(nexnet))
dldecision[nexnet$ltdl=="No" & nexnet$wifidl =="Yes"] = "Handover to WiFi"
dldecision[nexnet$ltdl=="Yes" & nexnet$wifidl =="No"] = "Handover to LTE"



# for uplink decision

uldecision = rep('No need to handover',nrow(nexnet))
uldecision[nexnet$ltul=="No" & nexnet$wifiul =="Yes"] = "Handover to WiFi"
uldecision[nexnet$ltul=="Yes" & nexnet$wifiul =="No"] = "Handover to LTE"



# for latency decision

latdecision = rep('No need to handover',nrow(nexnet))
latdecision[nexnet$ltlat=="No" & nexnet$wifiul =="Yes"] = "Handover to WiFi"
latdecision[nexnet$ltlat=="Yes" & nexnet$wifiul =="No"] = "Handover to LTE"


# for reliablity decision

sigdecision = rep('No need to handover',nrow(nexnet))
sigdecision[nexnet$ltsig=="No" & nexnet$wifisig =="Yes"] = "Handover to WiFi"
sigdecision[nexnet$ltsig=="Yes" & nexnet$wifisig =="No"] = "Handover to LTE"




# adding final results and displaying


app1.decision = data.frame(netdata$Date,netdata$Lat,netdata$Lon,netdata$DownLinkwifi,netdata$DownLinklte,dldecision)
app2.decision = data.frame(netdata$Date,netdata$Lat,netdata$Lon,netdata$UpLinkwifi,netdata$UpLinklte,uldecision)
app3.decision = data.frame(netdata$Date,netdata$Lat,netdata$Lon,netdata$Latencywifi,netdata$Latencylte,latdecision)
app4.decision = data.frame(netdata$Date,netdata$Lat,netdata$Lon,netdata$Signalwifi,netdata$Signallte,sigdecision)

fix(app1.decision)
fix(app2.decision)
fix(app3.decision)
fix(app4.decision)