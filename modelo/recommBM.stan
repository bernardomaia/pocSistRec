data{
  int T; //número de aspectos
  int R; //número de reviews 
  int<lower=1> U;// número de usuários
  int<lower=1, upper=U> z[R];//indica o número do usuário que escreveu a review
  real<lower=0, upper=10> S[R]; //notas
  row_vector[T]  X[R]; //nota extraída cada review para cada aspecto
  real<lower=1> alpha[T];
  real cauchy_max;
  real omega;


}

parameters {
  vector<lower=0, upper=5>[T] mu_U[U];
  simplex[T] mu;
  real<lower=0,upper=5> sigma[T];
}

model{
  mu ~ dirichlet(alpha);
  for (t in 1:T)
    sigma[t] ~ cauchy(0, cauchy_max);
  for (u in 1:U)
      for(t in 1:T)
        mu_U[u][t] ~ normal(mu[t],sigma[t]);
  for (r in 1:R)
    S[r] ~ normal(10.0/T *(X[r]*mu_U[z[r]]),omega);
}  
