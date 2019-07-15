`GAPIT.SS` <-
function(DP=NULL,IC=NULL){
#Object: To Sufficient Statistics (SS) for GWAS and GS
#Designed by Zhiwu Zhang
#Writen by Jiabo Wang
#Last update: Novenber 3, 2016
##############################################################################################
print("GAPIT.SS in process...")
#Define the funcitno here
Timmer=GAPIT.Timmer(Infor="GAPIT.SS")
Memory=GAPIT.Memory(Infor="GAPIT.SS")
if(!is.null(IC))
{
ic_GD=IC$GD
ic_GM=IC$GM
ic_Y=IC$Y
ic_KI=IC$K
ic_PCA=IC$PCA
Z=DP$Z

taxa_Y=as.character(ic_Y[,1])
Timmer=GAPIT.Timmer(Timmer=Timmer,Infor="GAPIT.QC")
Memory=GAPIT.Memory(Memory=Memory,Infor="GAPIT.QC")

if(DP$kinship.algorithm!="None" & DP$kinship.algorithm!="SUPER" & is.null(Z))
 {
 Z=as.data.frame(diag(1,nrow(ic_Y)))
 Z=rbind(taxa_Y,Z)
 taxa=c('Taxa',as.character(taxa_Y))
 Z=cbind(taxa,Z)
 }

if(max(ic_PCA[,2])==min(ic_PCA[,2]))ic_PCA=NULL
if (DP$SNP.test&DP$kinship.algorithm%in%c("FarmCPU","Blink","MLMM"))
 {
 Timmer=GAPIT.Timmer(Timmer=Timmer,Infor="GAPIT.FarmCPU")
 Memory=GAPIT.Memory(Memory=Memory,Infor="GAPIT.FarmCPU")
 myBus=GAPIT.Bus(Y=ic_Y,CV=ic_PCA,Z=NULL,GK=NULL,KI=ic_KI,GD=ic_GD,GM=ic_GM,GT=IC$GT,
                method=DP$kinship.algorithm,GTindex=DP$GTindex,LD=DP$LD,
                bin.size=DP$bin.size,bin.selection=DP$bin.selection,alpha=DP$alpha,WS=DP$WS,
                cutOff=DP$cutOff,p.threshold=DP$p.threshold,QTN.threshold=DP$QTN.threshold,
                maf.threshold=DP$maf.threshold,method.GLM=DP$method.GLM,method.sub=DP$method.sub,
                method.sub.final=DP$method.sub.final,method.bin=DP$method.bin,
				        DPP=DP$DPP,file.output=DP$file.output,Multi_iter=DP$Multi_iter )
 GWAS=myBus$GWAS
 Pred=myBus$GPS
 va=myBus$vg
 ve=myBus$ve
 h2=va/(va+ve)
 mc=NULL
#mc=(exp(1)^(1/GWAS$P.value))/10000
 bc=NULL
 mp=NULL
#myP=1/(exp(10000*fm$tau2)
#print(str(GWAS))
 TV=NULL
 Compression=NULL
 }
#print(ic_GD[1:10,1:10])



if(DP$SNP.test&!DP$kinship.algorithm%in%c("FarmCPU","MLMM","Blink"))
 {
 Timmer=GAPIT.Timmer(Timmer=Timmer,Infor="GAPIT.Main")
 Memory=GAPIT.Memory(Memory=Memory,Infor="GAPIT.Main")

	GT=as.matrix(ic_GD[,1])
#print("!!!!!!!")
#print(DP$sangwich.top)
 if(DP$PCA.total==0) ic_PCA=NULL

#print(dim(ic_PCA))
 gapitMain <- GAPIT.Main(Y=ic_Y,GD=DP$GD[,-1],GM=DP$GM,KI=ic_KI,Z=Z,CV=DP$CV,CV.Inheritance=DP$CV.Inheritance,GP=DP$GP,GK=DP$GK,SNP.P3D=DP$SNP.P3D,kinship.algorithm=DP$kinship.algorithm,
						bin.from=DP$bin.from,bin.to=DP$bin.to,bin.by=DP$bin.by,inclosure.from=DP$inclosure.from,inclosure.to=DP$inclosure.to,inclosure.by=DP$inclosure.by,
				        group.from=DP$group.from,group.to=DP$group.to,group.by=DP$group.by,kinship.cluster=DP$kinship.cluster,kinship.group=DP$kinship.group,name.of.trait=DP$name.of.trait,
                        file.path=DP$file.path,file.from=DP$file.from, file.to=DP$file.to, file.total=DP$file.total, file.fragment = DP$file.fragment, file.G=DP$file.G,file.Ext.G=DP$file.Ext.G,file.GD=DP$file.GD, file.GM=DP$file.GM, file.Ext.GD=DP$file.Ext.GD,file.Ext.GM=DP$file.Ext.GM, 
                        SNP.MAF= DP$SNP.MAF,FDR.Rate = DP$FDR.Rate,SNP.FDR=DP$SNP.FDR,SNP.effect=DP$SNP.effect,SNP.impute=DP$SNP.impute,PCA.total=DP$PCA.total,GAPIT.Version=GAPIT.Version,
                        GT=GT, SNP.fraction = DP$SNP.fraction, seed =DP$ seed, BINS = DP$BINS,SNP.test=DP$SNP.test,DPP=DP$DPP, SNP.permutation=DP$SNP.permutation,
                        LD.chromosome=DP$LD.chromosome,LD.location=LD.location,LD.range=LD.range,SNP.CV=SNP.CV,SNP.robust=DP$SNP.robust,model=DP$model,
                        genoFormat="EMMA",hasGenotype=TRUE,byFile=FALSE,fullGD=TRUE,PC=DP$PC,GI=ic_GM,Timmer = DP$Timmer, Memory = DP$Memory,
                        sangwich.top=DP$sangwich.top,sangwich.bottom=DP$sangwich.bottom,QC=DP$QC,GTindex=DP$GTindex,LD=DP$LD,file.output=FALSE,cutOff=DP$cutOff, GAPIT3.output=DP$file.output,
                        Model.selection = DP$Model.selection, Create.indicator = DP$Create.indicator,
						QTN=DP$QTN, QTN.round=DP$QTN.round,QTN.limit=DP$QTN.limit, QTN.update=QTN.update, QTN.method=DP$QTN.method, Major.allele.zero=DP$Major.allele.zero,NJtree.group=DP$NJtree.group,NJtree.type=DP$NJtree.type,plot.bin=DP$plot.bin, 
                        QTN.position=DP$QTN.position,plot.style=DP$plot.style,SUPER_GS=DP$SUPER_GS)  
#print(str(gapitMain))
 GWAS=gapitMain$GWAS
#print(head(GWAS))
 Pred=gapitMain$Pred
#print(head(Pred))
 va=NA#gapitMain$vg
 ve=NA#gapitMain$ve
 h2=gapitMain$h2
 mc=gapitMain$effect.snp
 bc=gapitMain$effect.cv
 mp=gapitMain$P
 TV=gapitMain$TV
 Compression=gapitMain$Compression
 }
myPower=NULL
#print(head(GWAS))
#print(DP$QTN.position)
if(!is.null(GWAS))myPower=GAPIT.Power(WS=DP$WS, alpha=DP$alpha, maxOut=DP$maxOut,seqQTN=DP$QTN.position,GM=DP$GM,GWAS=GWAS)

#print(str(myPower))
  #print("GAPIT.III accomplished successfully for multiple traits. Results are saved")
  return (list(GWAS=GWAS,Pred=Pred,FDR=myPower$FDR,Power=myPower$Power,
  Power.Alpha=myPower$Power.Alpha,alpha=myPower$alpha,h2=h2,va=va,ve=ve,
  mc=mc,bc=bc,mp=mp,TV=TV,Compression=Compression,
  Timmer=Timmer,Memory=Memory))
}else{
#
#print("!!!!!!!!!")
#print(dim(DP$GI))
gapitMain <- GAPIT.Main(Y=DP$Y,GD=DP$GD[,-1],GM=DP$GM,KI=DP$KI,Z=DP$Z,CV=DP$CV,CV.Inheritance=DP$CV.Inheritance,GP=DP$GP,GK=DP$GK,SNP.P3D=DP$SNP.P3D,kinship.algorithm=DP$kinship.algorithm,
            bin.from=DP$bin.from,bin.to=DP$bin.to,bin.by=DP$bin.by,inclosure.from=DP$inclosure.from,inclosure.to=DP$inclosure.to,inclosure.by=DP$inclosure.by,
                group.from=DP$group.from,group.to=DP$group.to,group.by=DP$group.by,kinship.cluster=DP$kinship.cluster,kinship.group=DP$kinship.group,name.of.trait=DP$name.of.trait,
                        file.path=DP$file.path,file.from=DP$file.from, file.to=DP$file.to, file.total=DP$file.total, file.fragment = DP$file.fragment, file.G=DP$file.G,file.Ext.G=DP$file.Ext.G,file.GD=DP$file.GD, file.GM=DP$file.GM, file.Ext.GD=DP$file.Ext.GD,file.Ext.GM=DP$file.Ext.GM, 
                        SNP.MAF= DP$SNP.MAF,FDR.Rate = DP$FDR.Rate,SNP.FDR=DP$SNP.FDR,SNP.effect=DP$SNP.effect,SNP.impute=DP$SNP.impute,PCA.total=DP$PCA.total,GAPIT.Version=GAPIT.Version,
                        GT=DP$GT, SNP.fraction = DP$SNP.fraction, seed =DP$ seed, BINS = DP$BINS,SNP.test=DP$SNP.test,DPP=DP$DPP, SNP.permutation=DP$SNP.permutation,
                        LD.chromosome=DP$LD.chromosome,LD.location=LD.location,LD.range=LD.range,SNP.CV=SNP.CV,SNP.robust=DP$SNP.robust,model=DP$model,
                        genoFormat="EMMA",hasGenotype=TRUE,byFile=FALSE,fullGD=TRUE,PC=DP$PC,GI=DP$GI,Timmer = DP$Timmer, Memory = DP$Memory,GAPIT3.output=DP$file.output,
                        sangwich.top=DP$sangwich.top,sangwich.bottom=DP$sangwich.bottom,QC=DP$QC,GTindex=DP$GTindex,LD=DP$LD,file.output=FALSE,cutOff=DP$cutOff, 
                        Model.selection = DP$Model.selection, Create.indicator = DP$Create.indicator,
            QTN=DP$QTN, QTN.round=DP$QTN.round,QTN.limit=DP$QTN.limit, QTN.update=QTN.update, QTN.method=DP$QTN.method, Major.allele.zero=DP$Major.allele.zero,NJtree.group=DP$NJtree.group,NJtree.type=DP$NJtree.type,plot.bin=DP$plot.bin, 
                        QTN.position=DP$QTN.position,plot.style=DP$plot.style,SUPER_GS=DP$SUPER_GS)  
#print(str(gapitMain))
GWAS=gapitMain$GWAS
#print(head(GWAS))
Pred=gapitMain$Pred
#print(head(Pred))
va=NA#gapitMain$vg
ve=NA#gapitMain$ve
h2=gapitMain$h2
mc=gapitMain$effect.snp
bc=gapitMain$effect.cv
mp=gapitMain$P
Compression=gapitMain$Compression

return (list(GWAS=GWAS,Pred=Pred,FDR=NULL,Power=NULL,
  Power.Alpha=NULL,alpha=NULL,h2=h2,va=va,ve=ve,Compression=Compression,
  mc=mc,bc=bc,mp=mp,TV=gapitMain$TV,
  Timmer=Timmer,Memory=Memory))
}#end of SNP.TEST

}  #end of GAPIT.SS function
#=============================================================================================
