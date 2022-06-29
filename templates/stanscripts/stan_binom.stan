data{
int N; // number of observations
int H; // number of observed head
}
parameters{
real<lower=0, upper=1> p; // parameter for binomial distribution
}
model{
// you can also specify the prior here.
// If you leave it empty, it will use a flat or uniform prior
p ~ uniform(0, 1);
H ~ binomial(N, p); // likelihood func
}
