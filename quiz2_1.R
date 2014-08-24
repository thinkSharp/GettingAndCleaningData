Q2q1 <-function() {
  library(httr)

  oauth_endpoints("github")

  leekApp <-oauth_app("github","b03dc608b0ab5d48f9ef")

  github_token <-oauth2.0_token(oauth_endpoints("github"),leekApp)

  gtoken <-config(token = github_token)

  req <-GET("https://api.github.com/users/jtleek/repos",gtoken)
  stop_for_status(req)
  content(req)
  ds <- req[[5]]
  ds$created_at
  

}

Q2q4 <-function() {
  con <- url("http://biostat.jhsph.edu/~jleek/contact.html ")
  html <- readLines(con)
  close(con)
  c(nchar(html[10]),nchar(html[20]),nchar(html[30]),nchar(html[100]))
  
}

Q2q5 <- function() {
  d <- read.fwf("wksst8110.for",widths = c(1,9,5,4,4,5,4,4,5,4,4,5,4,4),
                col.names = c("S1","weekly","S2","SST1","SSTA1","S3","SST2","SSTA2","S4","SST3","SSTA3","S5","SST4","SSTA4"), skip=4)
  d
  sum(d$SST2)
}