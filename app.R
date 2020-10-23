## app.R #####
library(shiny)
library(shinydashboard)
library(DT)
library(RColorBrewer)
library(tidyverse)
library(shinyWidgets)

#setwd("~/Documents/NYC_DSA/Project1_ShinyViz/ShinyViz/")

load(file = "gross.elec.RData")
load(file = "pv61.RData")
load(file = "pv61.pivot.RData")
load(file = "meterol2.RData")
load(file = "text.RData")


# shiny UI ####
ui <-
  dashboardPage(
    dashboardHeader(title = "Perspectives on a Solar Energy Future for Spain", titleWidth = 450),
    
    dashboardSidebar(
      sidebarUserPanel("Sections",
                       image = "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Flag_of_Spain.svg/200px-Flag_of_Spain.svg.png"),
      
      sidebarMenu(
        menuItem("Overview", tabName = "Overview", icon = icon("newspaper")),
        
        menuItem(
          "Gross Electricity Production",
          tabName = "Electricity",
          icon = icon("bolt")
        ),
        
        menuItem(
          "Solar PV Generation",
          tabName = "Solar",
          icon = icon("solar-panel")
        ),
        
        menuItem("Meteorology", tabName = "Meteorology", icon = icon("sun")),
        
        menuItem(
          "Conclusions and Future Work",
          tabName = "Conclusions",
          icon = icon("lightbulb")
        ),
        
        menuItem("Data", tabName = "Data", icon = icon("database")),
        
        menuItem("Citations", tabName = "Citations", icon = icon("info")),
        
        menuItem(
          "Author Information",
          tabName = "aboutme",
          icon = icon("address-book")
        )
      )
    ),
    
    dashboardBody(
      tabItems(
        # Overview tab ####
        tabItem(
          tabName = "Overview",
          fluidRow(column(
            12,
            align = "center",
            h1("Go Solar or Bust"),
            img(src = "IMG_20140720_194851smprogcrop.jpg", width = 720),
            h5("A typical sunny day in Madrid")
          )),
          
          h3(overv.para1),
          hr(),
          fluidRow(
            column(
              6,
              align = "center",
              h2("Europe Yearly Sunshine Duration Hours"),
              img(src =
                    "https://upload.wikimedia.org/wikipedia/commons/f/f8/Europe_sunshine_hours_map.png", height = 450),
              h5(
                "XL3 ",
                tags$a(href = "https://creativecommons.org/licenses/by-sa/3.0", "CC BY-SA 3.0"),
                "via Wikimedia Commons"
              )
            ),
            column(
              6,
              align = "center",
              h2("Europe Photovoltaic Power Potential"),
              img(src =
                    "Europe_PVOUT_mid-size-map_156x126mm-300dpi_v20180611.png", height = 450),
              h5(
                "Solar resource map © 2019 " ,
                tags$a(href = "https://solargis.com", "Solargis "),
                tags$a(href = "https://creativecommons.org/licenses/by-sa/4.0", "CC BY-SA 4.0")
              )
            )
          ),
          hr(),
          h3(overv.para2),
          hr(),
          fluidRow(column(12,
                          fluidRow(
                            column(
                              4,
                              align = "center",
                              h2("Spain Photovoltaic Power Potential"),
                              hr(),
                              img(src =
                                    "Spain_PVOUT_mid-size-map_156x178mm-300dpi_v20191205.png", width = 400),
                              h5(
                                "Solar resource map © 2019 " ,
                                tags$a(href = "https://solargis.com", "Solargis "),
                                tags$a(href = "https://creativecommons.org/licenses/by-sa/4.0", "CC BY-SA 4.0")
                              )
                            ),
                            column(
                              8,
                              h2(
                                "Example Solar Panel Installations on Municipal Buildings in Madrid",
                                align = "center"
                              ),
                              fluidRow(
                                column(
                                  6,
                                  align = "center",
                                  h4("Sports Complex Antonio Díaz Miguel"),
                                  tags$iframe(
                                    src = "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d468.81208605946966!2d-3.6955636582645743!3d40.47138442917199!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd42290cf8a79c9d%3A0x82c63cc604ee501a!2sBasic%20Sport%20Center%20Antonio%20Diaz%20Miguel!5e1!3m2!1sen!2ses!4v1603455570388!5m2!1sen!2ses" ,
                                    width = 400,
                                    height = 300
                                  )
                                ),
                                column(
                                  6,
                                  align = "center",
                                  h4("San Juan Bautista Cultural Center"),
                                  tags$iframe(
                                    src = "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d234.47261891804422!2d-3.657872553928412!3d40.45230805215735!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd422f2bcc4c5ee9%3A0xd8f8f40690c42dd1!2sSan%20Juan%20Bautista%20Cultural%20Center!5e1!3m2!1sen!2ses!4v1603456656510!5m2!1sen!2ses" ,
                                    width = 400,
                                    height = 300
                                  )
                                )
                              ),
                              fluidRow(
                                column(
                                  6,
                                  align = "center",
                                  h4("Orcasur Cultural Center"),
                                  tags$iframe(
                                    src = "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d234.77118707383917!2d-3.701259930006701!3d40.36666577778765!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd4227012f672bb5%3A0xb1e0fa5da9995b46!2sOrcasur%20Cultural%20Center!5e1!3m2!1sen!2ses!4v1603457954311!5m2!1sen!2ses" ,
                                    width = 400,
                                    height = 300
                                  )
                                ),
                                column(
                                  6,
                                  align = "center",
                                  h4("UID Villa de Vallecas"),
                                  tags$iframe(
                                    src = "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d234.72829189310687!2d-3.614667158296183!3d40.37897922962421!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd4225038d8dca71%3A0x8517bc6d354c9409!2sPolic%C3%ADa%20Municipal%20de%20Madrid%20Oficina%20de%20Atenci%C3%B3n%20Al%20Ciudadano%20Distrito%20Villa%20de%20Vallecas!5e1!3m2!1sen!2ses!4v1603458303394!5m2!1sen!2ses" ,
                                    width = 400,
                                    height = 300
                                  )
                                )
                              )
                            )
                          ))),
          hr(),
          h3(overv.para3),
          hr(),
        ),
        
        # Electricity tab ####
        tabItem(
          tabName = "Electricity",
          h2("Spain's Gross Electricity Production"),
          fluidRow(box(
            width = 12,
            pickerInput(
              inputId = "checkGroupAll",
              label = h3("Select Energy Sources"),
              choices = list(
                "Biogases" = 1,
                "Geothermal" = 2,
                "Hydro" = 3,
                "Manufactured gases" = 4,
                "Natural gas" = 5,
                "Non-renewable waste" =
                  6,
                "Nuclear heat" = 7,
                "Oil and petroleum products (excluding biofuel portion)" =
                  8,
                "Oil shale and oil sands" =
                  9,
                "Other liquid biofuels" = 10,
                "Peat and peat products" =
                  11,
                "Primary solid biofuels" = 12,
                "Pure biodiesels" = 13,
                "Renewable municipal waste" = 14,
                "Solar photovoltaic" =
                  15,
                "Solar thermal" = 16,
                "Solid fossil fuels" =
                  17,
                "Tide, wave, ocean" = 18,
                "Wind" = 19
              ),
              options = list(
                'actions-box' = TRUE,
                size = FALSE,
                'selected-text-format' = "values",
                width = "auto"
              ),
              multiple = TRUE,
              selected = c("5", "7", "8", "15", "16", "17", "19")
            )
          )),
          
          # For possible inclusion of grouped sources
          #    box(checkboxGroupInput(inputId= "checkGroupGrp", label = h3("Grouped Energy Sources"),
          #                        choices = list("Fossil fuels (Natural gas, oil/petroleum, coal, peat, etc.)" = 1, "Renewables (excluding solar)" = 2, "Wastes" = 3, "Hydro" = 4, "Nuclear" = 5, "Solar, photovoltaic and thermal"=6),
          #                        selected = NULL)),
          fluidRow(align = "center",
                   plotOutput(
                     "GEPplot", width = 800, height = 600
                   ))
        ),
        
        # Solar tab ####
        tabItem(
          tabName = "Solar",
          h2("Photovoltaic generation in Madrid"),
          fluidRow(box(
            width = 12,
            pickerInput(
              inputId = "checkGroupPV",
              label = h3("Select Buildings by Use"),
              choices = list(
                "Administrative" = "Administrativo",
                "Cultural Center" = "Centro Cultural",
                "Library" = "Biblioteca",
                "Mixed-use" = "Varios",
                "Park" = "Parque",
                "Public Safety" = "Seguridad y Emergencias",
                "School" = "Centro Escolar",
                "Senior Center" = "Centro Mayores",
                "Social Services Center" = "Centro Servicios Sociales",
                "Sports Complex" =
                  "Centro Deportivo",
                "Other" = "Other"
              ),
              options = list(
                'actions-box' = TRUE,
                size = FALSE,
                'selected-text-format' = "values",
                width = "auto"
              ),
              multiple = TRUE
            )
          )),
          fluidRow(plotOutput("PVplot"), width = "100%"),
          br(),
          fluidRow(plotOutput("PVplotbar"), width = "100%")
          # fluidRow(box(checkboxInput("suncheckbox", label = "Overlay Sunshine Data", value = FALSE))) # Reactive if statement not working
          # fluidRow(box(plotOutput("weatherplot"), width = "100%",height="100%")) # adding sunshine plot here causes page to get stuck and not render any plots!
        ),
        
        # Meteorology tab ####
        tabItem(tabName = "Meteorology", h2("Madrid monthly sunshine data"),
                fluidRow(
                  box(
                    plotOutput("weatherplot"),
                    width = "100%",
                    height = "100%"
                  )
                )),
        
        # Conclusions tab ####
        tabItem(
          tabName = "Conclusions",
          h1("Conclusions and Future Work"),
          fluidRow(column(
            width = 6,
            h2("Conclusions"),
            h3(
              "This data visualization is intended to demonstrate to the general public and interested parties the potential benefits of widespread generation of electricity using solar photovoltaics, generally in sunny regions, such as Spain, and more specifically in Madrid.
As a rough calculation, extrapolating the data from the 61 municipal buildings gives the following estimated values:
The yearly yield of the photovoltaic buildings test set is ~900000 kWh per year, or an average of 15000 kWh per year per building.
Extending this for larger implementation to the residential sector, there are ~110000 multi-unit apartment buildings in Madrid, giving a potential to generate 1.65 billion kWh per year. Considering that the energy consumption of the residental sector for 2019 was 4.3 billion kWh, the implementation of photovoltaics in every apartment building in the city could decrease consumption demand from the grid by ~38% per year."
            ),
          ),
          column(width = 6,
                 h2("Future Work"),
                 h3(
                   HTML(
                     "<ul><li>Use cadastral data to make more precise predictions regarding the number of potential buildings that could have solar photovoltaic installed (due to roof type, dimensions, construction date, etc.).</li><br></br><li>Present finer monthly analysis of potential solar energy yield and how much that would decrease grid electricity consumption. For example, in summer months sun duration is longer but energy consumption is increased, then how much would the dependence on the grid decrease?</li><br></br><li>Evaluate economic factors, including photovoltaic installation and maintenance costs and current electricity costs in Madrid.</li><br></br><li>Estimate how many tons of carbon dioxide would be prevented from atmospheric release (by month, year) with widespread implementation of photovoltaics.</li><br></br><li>Develop a calculation tool to aid building owners to decide if installation of photovoltaics would be economically feasible.</li></ul>"
                   )
                 ),))
        ),
        
        # Data tab ####
        tabItem(
          tabName = "Data",
          h2("Data Tables"),
          tabsetPanel(
            tabPanel(
              "Electricity Production by Source",
              h3(
                "Gross electricity production by source for EU regions and Spain (2018)"
              ),
              fluidRow(column(12,
                              DTOutput("GEPtable")))
            ),
            tabPanel(
              "Photovoltaic Generation Test Set",
              h3(
                "Photovoltaic generation from 61 municipal buildings in Madrid (01-2019 to 03-2020)"
              ),
              fluidRow(column(12, DTOutput("pvtable")))
            ),
            tabPanel(
              "Madrid Meterological Data",
              h3(
                "Meterological data from Madrid Barajas Airport (01-2019 to 03-2020)"
              ),
              fluidRow(column(12, DTOutput("meteroltable")))
            )
          )
        ),
        
        # h3(
        #   "Gross electricity production by source for EU regions and Spain (2018)"
        # ),
        # fluidRow(column(12,
        #                 DTOutput("GEPtable"))),
        # hr(),
        
        
        # Citation tab ####
        tabItem(
          tabName = "Citations",
          h2("Sources"),
          h4(
            "Energy data for Europe 2013-2019:",
            tags$a(href = "https://ec.europa.eu/eurostat/documents/3217494/11099022/KS-HB-20-001-EN-N.pdf/bf891880-1e3e-b4ba-0061-19810ebf2c64",
                   "Eurostat")
          ),
          h4(
            "Gross electricity production by source 2018:",
            tags$a(href = "https://appsso.eurostat.ec.europa.eu/nui/show.do?query=BOOKMARK_DS-1015839_QID_-404B008F_UID_-3F171EB0&layout=SIEC,L,X,0;GEO,L,Y,0;NRG_BAL,L,Z,0;UNIT,B,Z,1;TIME,C,Z,2;INDICATORS,C,Z,3;&zSelection=DS-1015839NRG_BAL,GEP;DS-1015839UNIT,GWH;DS-1015839INDICATORS,OBS_FLAG;DS-1015839TIME,2018;&rankName1=UNIT_1_2_-1_2&rankName2=NRG-BAL_1_2_-1_2&rankName3=INDICATORS_1_2_-1_2&rankName4=TIME_1_0_1_0&rankName5=SIEC_1_2_0_0&rankName6=GEO_1_2_0_1&rStp=&cStp=&rDCh=&cDCh=&rDM=true&cDM=true&footnes=false&empty=false&wai=false&time_mode=ROLLING&time_most_recent=true&lang=EN&cfo=%23%23%23%2C%23%23%23.%23%23%23",
                   "Eurostat")
          ),
          h4(
            "Madrid photovoltaic electricity production 2019-2020:",
            tags$a(
              href = "https://datos.madrid.es/portal/site/egob/menuitem.c05c1f754a33a9fbe4b2e4b284f1a5a0/?vgnextoid=e2eece114eaa0710VgnVCM1000001d4a900aRCRD&vgnextchannel=374512b9ace9f310VgnVCM100000171f5a0aRCRD&vgnextfmt=default",
              "City of Madrid Open Data Portal (Origen de los datos: Ayuntamiento de Madrid)"
            )
          ),
          h4(
            "Madrid electricity consumption 2019:",
            tags$a(
              href = "https://www.madrid.es/portales/munimadrid/es/Inicio/El-Ayuntamiento/Estadistica/Areas-de-informacion-estadistica/Energia-gas-y-electricidad/Electricidad/Infraestructura-y-consumo-electrico/?vgnextfmt=default&vgnextoid=3e48bb8d11a59210VgnVCM2000000c205a0aRCRD&vgnextchannel=c40a8131dd22a210VgnVCM1000000b205a0aRCRD",
              "City of Madrid Open Data Portal (Origen de los datos: Ayuntamiento de Madrid)"
            )
          ),
          h4(
            "Madrid catastral data 2018:",
            tags$a(
              href = "https://datos.madrid.es/portal/site/egob/menuitem.c05c1f754a33a9fbe4b2e4b284f1a5a0/?",
              "City of Madrid Open Data Portal (Origen de los datos: Ayuntamiento de Madrid)"
            )
          ),
          h4(
            "Meterological data from Madrid Barajas Airport 2019-2020:",
            tags$a(href = "https://opendata.aemet.es/centrodedescargas/productosAEMET?",
                   "Agencia Estatal de Meterologia de España")
          )
        ),
        # Author Information tab ####
        tabItem(
          tabName = "aboutme",
          h1("About Me"),
          h2("Ryan Kniewel"),
          h3(
            "I have a diverse background in biotechnology and synthetic biology with over 20 years of experience engineering microorganisms using tools from biochemistry, molecular biology, genetics and bioinformatics. I am expanding my knowledge base to address a new range of problems through the application of data science techniques. My varied interests span the fields of public health, sustainability, mechanical and structural failure prediction, geography and cartography, biological population dynamics, science and society, logistics, and archeology."
          ),
          hr(),
          h2("Contact Information"),
          h3(tags$a(href = "https://github.com/rkmad", "GitHub")),
          h3(
            tags$a(href = "https://www.linkedin.com/in/ryan-kniewel", "LinkedIn")
          )
        )
      )
    )
  )










###############################################

# Shiny server ####
server <- function(input, output) {
  # Gross electricity response and stacked bar plot ####
  
  ind.sources <-
    c(
      "Biogases",
      "Geothermal",
      "Hydro",
      "Manufactured gases",
      "Natural gas",
      "Non-renewable waste",
      "Nuclear heat",
      "Oil and petroleum products (excluding biofuel portion)",
      "Oil shale and oil sands",
      "Other liquid biofuels",
      "Peat and peat products",
      "Primary solid biofuels",
      "Pure biodiesels",
      "Renewable municipal waste",
      "Solar photovoltaic",
      "Solar thermal",
      "Solid fossil fuels",
      "Tide, wave, ocean",
      "Wind"
    )
  # Possible future Idea to group sources
  # grp.sources<- c("Fossil fuels (Natural gas, oil/petroleum, coal, peat, etc.)","Renewables (excluding solar)", "Wastes" ,
  #                 "Hydro" , "Nuclear" , "Solar, photovoltaic and thermal")
  
  
  gross.elec.response <-
    reactive({
      gross.elec %>%
        filter(
          .,
          Source %in% ind.sources[as.numeric(input$checkGroupAll)] &
            Region != "European Union - 27 countries (from 2020)" &
            Source != "Total" &
            Source != "Renewables and biofuels" & Value > 0
        )
    })
  
  output$GEPplot <- renderPlot(
    gross.elec.response() %>%
      ggplot(aes (
        x = Region, y = Value, fill = Source
      )) +
      theme_bw() +
      geom_bar(position = "fill", stat = "identity") +
      ggtitle(
        "Percentage of gross electricity production by source in Spain and EU regions (2018)"
      ) +
      labs(y = "Percentage %") +
      guides(x =  guide_axis(angle = 0)) +
      scale_x_discrete(
        labels = function(x) {
          is_long <- nchar(x) > 19
          x[is_long] <- substr(x[is_long], 1, 19)
          x
        }
      ) +
      scale_y_continuous(breaks = seq(0, 1, 0.1),
                         labels = scales::percent) +
      scale_fill_manual(values = rep(brewer.pal(12, "Paired"), times = 3)) +
      theme(plot.title = element_text(hjust = 0.5))
  )
  
  
  # pv61.pivot.response and plotting ####
  pv61.pivot.response <-
    reactive({
      pv61.pivot %>%
        filter(.,
               type %in% input$checkGroupPV &
                 month != "total2019",
               month !=  "total2020")
    })
  
  month.levels <- c(
    "01-2019",
    "02-2019",
    "03-2019",
    "04-2019",
    "05-2019",
    "06-2019",
    "07-2019",
    "08-2019",
    "09-2019",
    "10-2019",
    "11-2019",
    "12-2019",
    "01-2020",
    "02-2020",
    "03-2020"
  )
  
  
  # Table of sum PV generated by month
  # output$pv.response <-
  #   renderTable({
  #     pv61.pivot.response() %>% group_by(., month) %>% mutate_each(funs(replace(., which(is.na(
  #       .
  #     )), 0))) %>% mutate(., sum = sum(values)) %>% summarise(., monthly.generation =
  #                                                               mean(sum))
  #   })
  
  
  output$PVplot <- renderPlot({
    ggplot(pv61.pivot.response()) +
      theme_bw() +
      geom_line(aes(
        x = factor(month,
                   level = month.levels),
        y = values,
        color = building,
        group = building
      )) +
      geom_point(
        aes(
          x = factor(month,
                     level = month.levels),
          y = values,
          group = building
        ),
        shape = 21,
        color = "gray",
        size = 1.5,
        stroke = 0.5
      ) +
      ggtitle("Photovoltaic generation of municipal buildings in Madrid (01-2019 to 03-2020)") +
      labs(x = "Month", y = "kWh") +
      scale_color_manual(values = rep(brewer.pal(8, "Dark2"), times = 100)) +
      theme(legend.position = "right",
            plot.title = element_text(hjust = 0.5))
  })
  
  
  
  # NOT WORKING: WANT TO ADD TOOLTIP
  #  output$info <- renderPrint({
  #   nearPoints( pv61.pivot.response(), input$GEPplot.hover, threshold=10, maxpoints=1, addDist=TRUE)
  # })
  
  
  # monthly bar plot #####
  
  
  output$PVplotbar <- renderPlot(
    ggplot(
      pv61.pivot.response() %>% group_by(., month) %>% mutate_each(funs(replace(
        ., which(is.na(.)), 0
      ))) %>% mutate(., sum = sum(values)) %>% summarise(., monthly.generation =
                                                           mean(sum))
    ) +
      theme_bw() +
      geom_bar(aes(
        x = factor(month,
                   level = month.levels),
        y = monthly.generation,
        fill = month
      ), stat = "identity") +
      
      ggtitle(
        "Photovoltaic generation in kWh by month for selected buildings (01-2019 to 03-2020)"
      ) +
      labs(x = "Month", y = "kWh") +
      geom_text(
        aes(
          x = factor(month,
                     level = month.levels),
          y = monthly.generation,
          label = round(monthly.generation)
        ),
        vjust = -0.5,
        size = 4.5
      ) +
      scale_fill_manual(
        values = c(
          brewer.pal(11, "Spectral")[11],
          brewer.pal(11, "Spectral")[11],
          "gray",
          "gray",
          "#9E0142",
          "#9E0142",
          brewer.pal(11, "Spectral")[2:10]
        )
      ) +
      geom_line(
        meterol2,
        mapping = aes(
          x = factor(fecha,
                     level = month.levels),
          y = inso * 10000,
          group = 1
        ),
        color = "red",
        size = 1,
        linetype = 3
      ) +
      
      geom_line(
        meterol2,
        mapping = aes(
          x = factor(fecha,
                     level = month.levels),
          y = n_des * 10000,
          group = 1
        ),
        color = "green",
        size = 1,
        linetype = 3
      ) +
      guides(fill = FALSE) +
      
      
      geom_line(
        meterol2,
        mapping = aes(
          x = factor(fecha,
                     level = month.levels),
          y = glo,
          group = 1
        ),
        color = "blue",
        size = 1,
        linetype = 3
      ) +
      
      scale_y_continuous(sec.axis = sec_axis(~ . / 10000, name = "Units")) +
      annotate(
        "text",
        x = 12.93,
        y = 19 * 10000,
        label = "Num. cloudless days"
      ) +
      annotate(
        "segment",
        x = 11.2,
        xend = 11.8,
        y = 19 * 10000,
        yend = 19 * 10000,
        colour = "green",
        size = 1.2,
        linetype = 3
      ) +
      
      annotate(
        "text",
        x = 12.9,
        y = 18 * 10000,
        label = "Avg. hours daily sun"
      ) +
      annotate(
        "segment",
        x = 11.2,
        xend = 11.8,
        y = 18 * 10000,
        yend = 18 * 10000,
        colour = "red",
        size = 1.2,
        linetype = 3
      ) +
      
      annotate(
        "text",
        x = 13.35,
        y = 17 * 10000,
        label = expression("Avg. daily solar radiation KJ/m" ^ 2 * " (x10" ^ 5 *
                             ")")
      ) +
      annotate(
        "segment",
        x = 11.2,
        xend = 11.8,
        y = 17 * 10000,
        yend = 17 * 10000,
        colour = "blue",
        size = 1.2,
        linetype = 3
      ) +
      theme(plot.title = element_text(hjust = 0.5))
  )
  
  
  # NOT WORKING reactive if else statement for bar plot overlay ####
  #  sun.reactive<- reactive({input$suncheckbox})
  #
  # output$PVplotbar <- renderPlot(
  #       if (sun.reactive == TRUE ) {
  #         monthly.bar.plot + sun.data.plot.overlay
  #       } else {
  #         monthly.bar.plot
  #       }
  #     )
  
  
  # Meteorology plot ####
  
  output$weatherplot <- renderPlot({
    #   output.range <- renderPrint({ input$slider2 })
    ggplot(meterol2) +
      theme_bw() +
      geom_line(aes(
        x = factor(fecha,
                   level = month.levels),
        y = inso,
        group = 1
      ), color = "red") +
      geom_line(aes(
        x = factor(fecha,
                   level = month.levels),
        y = glo / 10000,
        group = 1
      ), color = "blue") +
      geom_line(aes(
        x = factor(fecha,
                   level = month.levels),
        y = n_des,
        group = 1
      ), color = "green") +
      ggtitle("Madrid Meteorological Data (01-2019 to 03-2020)") +
      labs(x = "Month", y = "Units") +
      
      annotate("text",
               x = 12.93,
               y = 19,
               label = "Num. cloudless days") +
      annotate(
        "segment",
        x = 11.5,
        xend = 11.8,
        y = 19,
        yend = 19,
        colour = "green"
      ) +
      
      annotate("text",
               x = 12.9,
               y = 18,
               label = "Avg. hours daily sun") +
      annotate(
        "segment",
        x = 11.5,
        xend = 11.8,
        y = 18,
        yend = 18,
        colour = "red"
      ) +
      
      annotate(
        "text",
        x = 13.35,
        y = 17,
        label = expression("Avg. daily solar radiation KJ/m" ^ 2 * " (x10" ^ 5 *
                             ")")
      ) +
      annotate(
        "segment",
        x = 11.5,
        xend = 11.8,
        y = 17,
        yend = 17,
        colour = "blue"
      ) +
      theme(plot.title = element_text(hjust = 0.5))
  })
  
  
  # Render data tables ####
  output$GEPtable <- renderDT(gross.elec)
  output$pvtable <- renderDT(pv61)
  output$meteroltable <- renderDT(meterol2)
  
  
}

shinyApp(ui, server)