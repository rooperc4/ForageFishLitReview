#' A function to make a table of the number of times a pressure occurs in a set of columns
#'
#' This function to make a table of the number of times a pressure occurs in a set of columns.
#' @param pressures The name of the pressure to be counted
#' @param parameter_columns The column(s) where the occurences of the pressure will be counted
#' @keywords forage fish, pressures, drivers, literature summary
#' @export
#' @examples
#' pressure_table(c("saliity","temperature"),data[,22:32])


  pressure_table<-function(pressures,parameter_columns){
  require(tidyr)
    t2<-data.frame(array(dim=c(length(pressures),length(parameter_columns))))
    colnames(t2)<-colnames(parameter_columns)
    for(i in 1:length(pressures)){
      t2[i,]<-apply(parameter_columns,MARGIN=2,function(x){how_many_times(pressures[i],x)})
    }
    t2$pressure<-pressures
    t2<-pivot_longer(t2,colnames(parameter_columns),names_to="outcome",values_to="count")
    return(t2)
  }


#' A function to determine how many times a pressure occurs in a column
#'
#' This function counts the number of instances of a pressure (word match) in a column where each row can contain
#' multiple pressures
#' @param pressures The name of the pressure to be counted
#' @param parameter_columns The column(s) where the occurences of the pressure will be counted
#' @keywords forage fish, pressures, drivers, literature summary
#' @export
#' @examples
#' how_many_times("salinity",data[,22:35])

how_many_times<-function(pressures,parameter_columns){
  hmt<-length(grep(pressures,parameter_columns,fixed=TRUE))
  return(hmt)}
#########

#########

#########

#' A function to make a table of the number of times a life history stage occurs in the column "Life stage studied (Adult, Juvenile, Larval, Egg)"

#'
#' This function to make a table of the number of times a life history stage occurs in that column.
#' @param lifestage The name of the life stage to be counted
#' @param parameter_column The column where the occurences of the the life history stage will be counted
#' @keywords forage fish, life stage, species common name, literature summary
#' @export
#' @examples


lifestage_table<-function(lifestage,parameter_columns){
  require(tidyr)
  t3<-data.frame(array(dim=c(length(lifestage),length(parameter_columns))))
  colnames(t3)<-colnames(parameter_columns)
  for(i in 1:length(lifestage)){
    t3[i,]<-apply(parameter_columns,MARGIN=2,function(x){how_many_times(lifestage[i],x)})
  }
  t3$lifestage<-lifestage
  t3<-pivot_longer(t3,colnames(parameter_columns),names_to="outcome",values_to="count")
  return(t3)
}


#' A function to determine how many times a lifestage occurs in a column
#'
#' This function counts the number of instances of a lifestage (word match) in a column where each row can contain
#' multiple lifestages
#' @param lifestage The name of the lifestage to be counted
#' @param parameter_columns The column(s) where the occurences of the lifestage will be counted
#' @keywords forage fish, life stage, species common name, literature summary
#' @export
#' @examples

LHS_how_many_times<-function(lifestage,parameter_columns){
  LHS_hmt<-length(grep(lifestage,parameter_columns))
  return(LHS_hmt)}






