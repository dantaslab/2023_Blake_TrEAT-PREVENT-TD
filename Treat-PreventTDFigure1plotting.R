##Load data and metadata
metadataalphacomplete<-read.csv("230424_PreventTDAlphadivcompletedppx.csv")
##Plot Fig. 1D
ggplot(metadataalphacomplete, aes(as.factor(Visit), y=shannon, color=Randomisation)) + geom_boxplot(outlier.shape = NA) +geom_point(position = position_jitterdodge(jitter.width = 0.1)) +ggtitle("Shannon Diversity")+xlab("Visit")+ylab("Shannon Diversity") + theme(axis.text.x = element_text(angle = 45, hjust = 1))+theme(axis.text.x = element_text(size=16), axis.title.x=element_text(size=20), axis.title.y = element_text(size=20), axis.text.y = element_text(size=16), axis.title = element_text(size=24))+scale_color_manual(values = c("Placebo" = "#E31A1C", "Rifaximin 550 mg daily" = "#1F78B4","Rifaximin 550 mg twice a day" = "#FF7F00"))+theme_pub()
##Plot Fig. 1E
ggplot(metadataalphacomplete, aes(as.factor(Visit), y=richness, color=Randomisation)) + geom_boxplot(outlier.shape = NA) +geom_point(position = position_jitterdodge(jitter.width = 0.1)) +ggtitle("Richness")+xlab("Visit")+ylab("Number of Species") + theme(axis.text.x = element_text(angle = 45, hjust = 1))+theme(axis.text.x = element_text(size=16), axis.title.x=element_text(size=20), axis.title.y = element_text(size=20), axis.text.y = element_text(size=16), axis.title = element_text(size=24))+scale_color_manual(values = c("Placebo" = "#E31A1C", "Rifaximin 550 mg daily" = "#1F78B4","Rifaximin 550 mg twice a day" = "#FF7F00"))+theme_pub()


