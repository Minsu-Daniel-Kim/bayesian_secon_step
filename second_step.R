source("utilities.R")
source("BernGrid.R")
# Theta = seq( 0 , 1 , length=1001 ) # Fine teeth for Theta.
# pTheta = pmin( Theta , 1-Theta ) # Triangular shape for pTheta.

first_example <- function() {

Theta = seq( 0 , 1 , length=10001 ) # Fine teeth for Theta.
pTheta = rep(1,length(Theta)) # Uniform (horizontal) shape for pTheta.
pTheta = pTheta/sum(pTheta)
Data = c(rep(0,30),rep(1,10)) # 25% heads, N=40

openGraph(width=5,height=7)
posterior = BernGrid( Theta, pTheta , Data , plotType="Bars" ,
                      showCentTend="Mode" , showHDI=TRUE , showpD=FALSE )

}
third_example <- function() {
  
  Theta = seq( 0 , 1 , length=1001 ) # Fine teeth for Theta.
  pTheta = pmin( Theta , 1-Theta ) # Triangular shape for pTheta.
  pTheta = pTheta ^ 20 # Sharpen pTheta !
  pTheta = pTheta/sum(pTheta) # Make pTheta sum to 1.0
  Data = c(rep(0,30),rep(1,10)) # 25% heads, N=40
  openGraph(width=5,height=7)
  posterior = BernGrid( Theta, pTheta , Data , plotType="Bars" ,
                        showCentTend="Mode" , showHDI=TRUE , showpD=FALSE )
  
}
iteration <- function(n = 5, x)
{
  Theta = seq( 0 , 1 , length=1001 ) # Fine teeth for Theta.
  pTheta = pmin( Theta , 1-Theta ) # Triangular shape for pTheta.
  pTheta = pTheta ^ 20 # Sharpen pTheta !
  pTheta = pTheta/sum(pTheta) # Make pTheta sum to 1.0
  Data = c(rep(0,30),rep(1,10)) # 25% heads, N=40
  openGraph(width=5,height=7)
  posterior = BernGrid( Theta, pTheta , Data , plotType="Bars" ,
                        showCentTend="Mode" , showHDI=TRUE , showpD=FALSE )
  for (i in 1:n) {
    p1 <- proc.time()
    Sys.sleep(x)
    posterior = BernGrid( Theta, posterior , Data , plotType="Bars" ,
                          showCentTend="Mode" , showHDI=TRUE , showpD=FALSE )
    proc.time() - p1 # The cpu usage should be negligible
  }
}

first_example()


third_example()

iteration(n = 10, 5)
