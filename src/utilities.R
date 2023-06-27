
#======Export pheatmap files as PDF=============================================
save_pheatmap_pdf <- function(x, filename, width=7, height=7) {
  stopifnot(!missing(x))
  stopifnot(!missing(filename))
  pdf(filename, width=width, height=height)
  grid::grid.newpage()
  grid::grid.draw(x$gtable)
  dev.off()
}

#======Set Colors===============================================================

patho.colors <- c("DAEC" = "#75A43A",
                  "EAEC" = "#D95F03",
                  "EHEC" = "#E7AA02",
                  "EIEC" = "#E72A8A",
                  "EPEC" = "#006279",
                  "ETEC" = "#7570B4",
                  "hybrid" = "#CB4B40",
                  "none" = "#C0BEC0",
                  "STEC" = "#9F7831")

patho.colors.v2 <- c("DAEC" = "#75A43A",
                  "EAEC" = "#D95F03",
                  "EHEC" = "#E7AA02",
                  "EIEC" = "#E72A8A",
                  "EPEC" = "#006279",
                  "ETEC" = "#7570B4",
                  "hybrid" = "#CB4B40",
                  "none" = "#C0BEC0")

patho.colors.v3<- c("DAEC" = "#75A43A",
                    "EAEC" = "#D95F03",
                    "EHEC" = "#E7AA02",
                    "EIEC" = "#E72A8A",
                    "EPEC" = "#006279",
                    "ETEC" = "#7570B4",
                    "hybrid" = "#CB4B40",
                    "none_high" = "#6E6E6E",
                    "none_low" = "#E8E8E8")


oi <- c("#265C00","#486824","#258039","#21A567","#00a890",
        "#ace600", "#f9e02a", "#ffcc00","#B27300",
        "#A10115","#731D1D", "#B2473E","#C5001A",
        "#cc66ff", "#CE6BAF",
        "#797CBA","#61A9D9","#2F496E","#3A5199")

snp.colors <- c("same" = "#F8766D", "diff" = "#C7C8C7")

TRT.colors <- c(
  "AZI" =	"#0A4451",
  "LEV" =	"#1B7D85",
  "RIF" = "#8ACCC4",
  "PLA" = "#AF2B30",
  "LOP" = "#CF5D42"
)

# phylogroup.colors <- c(
#     "A" = "#579EC9",
#     "B1" = "#CB4B40",
#     "B2" = "#E6AE5A",
#     "C" = "#57A973",
#     "cladeI" = "#E9E9E9",
#     "D" = "#CA3F70",
#     "E" = "#C68D61",
#     "F" = "#763378"
#   )

phylogroup.colors.v2 <- c(
  "A" = "#0067A2",
  "B1" = "#CB4B40",
  "B2" ="#AF7E56",
  "C" = "#289A84",
  "cladeI" = "#E9E9E9",
  "D" = "#CB7223",
  #"E" = "#7FA4C7",
  "F" = "#AF7E56"
  #"H" = "#FF7E79"
)

phylogroup.colors.v3 <- c(
  "A" = "#0067A2",
  "B1" = "#CB4B40",
  "B2" ="#AF7E56",
  "C" = "#289A84",
  "cladeI" = "#E9E9E9",
  "D" = "#CB7223",
  "E" = "#7FA4C7",
  "F" = "#AF7E56",
  "H" = "#FF7E79"
)


var.colors <- c(    "Exclude"  = "#a42b16",
                    "Include"  = "#16a46c",
                    "A"        = "#4A5C54",
                    "D"        = "#C5DBD1",
                    "Completeness" = "#164ea4",
                    "Contamination" = "#a42b16",
                    "Per_Greater500"     = "#33ccff",
                    "Per_Less500"        = "#ffcc00",
                    "Num_contigs_ge500bp" = "#33ccff",
                    "Num_contigs_lt500bp" = "#ffcc00"
)


heatmapx.colors <- list(pathotype = c(
                    "EAEC" = "#D95F03",
                    "EHEC" = "#E7AA02",
                    "EIEC" = "#E72A8A",
                    "EPEC" = "#1E9E78",
                    "ETEC" = "#7570B4",
                    "none" = "#C0BEC0"
                    ),
                    cluster = c(
                    "cluster1" = "#F1EEF6",
                    "cluster2" = "#D4B9DA",
                    "cluster3" = "#C994C7",
                    "cluster4" = "#DF65B0",
                    "cluster5" = "#E7298A",
                    "cluster6" = "#CE1256",
                    "cluster7" = "#91003F"
                    ),
                    Class = c(
                    "AMINOGLYCOSIDE" = "#6DB187",
                    "BETA-LACTAM" = "#8468FF",
                    "EFFLUX" = "#cbcbcb",
                    "MACROLIDE" = "#EB183F",
                    "PHENICOL" = "#E3AF5E",
                    "QUINOLONE" = "#6BD2FE",
                    "RIFAMYCIN" = "#C853FF",
                    "STREPTOTHRICIN" = "#6AE8B2",
                    "SULFONAMIDE" = "#D2B6FF",
                    "TETRACYCLINE" = "#F88EA2",
                    "TRIMETHOPRIM" = "#FFDDA7"
                    ),
                    phylogroup = c(
                    "A" = "#579EC9",
                    "B1" = "#CB4B40",
                    "B2" = "#E6AE5A",
                    "C" = "#57A973",
                    "cladeI" = "#E9E9E9",
                    "D" = "#CA3F70",
                    "F" = "#763378"
                    ),
                    treatment = c(
                      "AZI" =	"#132F5D",
                      "LEV" =	"#648FBB",
                      "RIF" = "#D4E5F0",
                      "PLA" = "#A32A31",
                      "LOP" = "#F5A582"
                    ),
                    none_group = c(
                      "none_high" =	"#6e6e6e",
                      "none_low" =	"e8e8e8"
                    )
)

amg.vars <- c(
                  "aac(3)-IIe",
                  "ant(3'')",
                  "aadA1",
                  "aadA2",
                  "aadA5",
                  "aph(3'')-Ib",
                  "aph(3')-Ia",
                  "aph(6)-Id",
                  "aac(6')-Ib-cr5"
)
amg.colors <- c(
  "#BBFD97",
  "#6DB187"
)


bla.vars <- c(
                  "blaTEM",
                  "blaTEM-1",
                  "blaCTX-M-15",
                  "blaEC",
                  "blaOXA-1"
)
bla.colors <- c(
  "#D2B6FF",
  "#8468FF"
)


eff.vars <- c(
                  "mdtM",
                  "emrD",
                  "acrF"
)
eff.colors <- c(
  "#F88EA2",
  "#EB183F"

)

phen.vars <- c(
                  "floR",
                  "catA1",
                  "catB3"
)
phen.colors <- c(
  "#FFDDA7",
  "#E3AF5E"
)

quin.vars <- c(
                  "qepA4",
                  "qnrB19",
                  "qnrS1"
)
quin.colors <- c(
  "#A5E8FF",
  "#6BD2FE"
)

tet.vars <- c(
                  "tet(A)",
                  "tet(B)",
                  "tet(D)"
)
tet.colors <- c(
  "#6AE8B2",
  "#3FBD87"
)

trim.vars <- c(
                  "dfrA12",
                  "dfrA14",
                  "dfrA15",
                  "dfrA17",
                  "dfrA7",
                  "dfrA8",
                  "dfrA1"
)
trim.colors <- c(
  "#DF9DFF",
  "#C853FF"
)

# Other =   MACROLIDE, RIFAMYCIN, STREPTOTHRICIN, SOLFONAMIDE

other.vars <- c(
                  "erm(B)",
                  "mph(A)",
                  "arr",
                  "sat2",
                  "sul1",
                  "sul2"
)
other.colors <- c(
  "gray72",
  "gray30"
)

#=====Custom defined themes=====================================================

theme_pub <- function() {

  color.background = "white"
  color.grid.major = "grey30"
  color.grid.minor = "grey60"
  color.axis.text = "#2a3132"
  color.axis.title = "#2a3132"
  color.title = "#2a3132"
  
  # Begin construction of chart
    theme_cowplot() +
    ggplot2::theme( 
        #text = element_text(family = "Helvetica", size=8),
        text = element_text(family = "Arial", size=8)       
        #line = element_line(size=0.3)
    ) +
      
    # Format the legend, hide by default
    ggplot2::theme(  
        legend.position    = "bottom",
        #legend.position    = "none",
        legend.margin      = margin(4, 4, 4, 4),
        legend.key.size    = unit(8, "pt"),
        legend.box.spacing = unit(4, "pt"),
        legend.text        = element_text(size=8, color = color.axis.title),
        legend.title       = element_text(size=10, face="bold")
    ) +
  
    # Set axis labels, text and format tick marks
    ggplot2::theme(  
           axis.text          = element_text(size=8),
           axis.text.x        = element_text(size = 8, angle = 0, color=color.axis.text, margin = margin(1, 0, 0, 0)),
           axis.text.y        = element_text(angle = 0, color=color.axis.text, margin = margin(0, 1, 0, 0)),
           axis.text.x.top    = element_text(margin = margin(0, 0, 1, 0)),
           axis.text.y.right  = element_text(margin = margin(0, 0, 0, 1)),
           axis.ticks         = element_line(size=0.5),
           axis.ticks.length  = unit(2, "pt"),

           axis.line          = element_line(size=0.5),
           axis.line.x        = element_line(size=0.5),
           axis.line.y        = element_line(size=0.5),
            
           axis.title         = element_text(size=10, face="bold", color = color.axis.title),
           axis.title.x.top   = element_text(margin = margin(0, 0, 2, 0)),
           axis.title.y.right = element_text(margin = margin(0, 0, 0, 2)),
           axis.title.x       = element_text(margin = margin(1, 0, 0.5, 0), vjust=0),
           axis.title.y       = element_text(margin = margin(0, 1, 0, 0.5), vjust=1.25)
    ) +

    # Format facet heading
    ggplot2::theme( 
            strip.text   = element_text(size=10, face="bold"),
            strip.text.x = element_text(margin = margin(3, 0, 1.5, 0)), 
            strip.text.y = element_text(margin = margin(0, 3, 0, 3)),
            # strip.background = element_rect(fill = "#efefef", color = "#2a3132"),
            strip.background   = element_blank()
    ) +
        
    ## Format the grid
    ggplot2::theme(
    #        panel.grid.major=element_line(color=color.grid.major,size=.50)) +
    #        panel.grid.minor=element_line(color=color.grid.minor,size=.50)) +
             panel.spacing      = unit(3, "pt")
    ) +
    
    # Format plot title and margin  
    ggplot2::theme(  
            plot.title = element_text(size=12, color=color.title),
            # plot.title = element_text(size=12, color=color.title, family = "Futura-Book"),
            # plot.margin = unit(c(0.35, 0.3, 0.35, 0.35), "cm"),
            plot.margin = margin(3, 3, 3, 3)
            
    )
}
