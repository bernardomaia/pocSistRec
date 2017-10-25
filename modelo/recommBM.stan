data{
  int T; //número de aspectos
  int N; //número de reviews 
  int<lower=1> U;// número de usuários
  int<lower=1, upper=U> review_U[N];//indica o número do usuário que escreveu a review
  real<lower=0, upper=10> S[N]; //notas
  row_vector[T]  sT[N]; //nota extraída cada review para cada aspecto 
}

parameters {
  vector<lower=0, upper=5>[T] mu_U[U];
  vector<lower=0, upper=1>[T] mu;
  real<lower=0,upper=5> sigma[U];
}

model{
  mu ~ normal(0, 1);
  for (t in 1:U)
    sigma[U] ~ cauchy(0, 5);
  for (u in 1:U)
    mu_U[u] ~ normal(mu,sigma[u]);
  for (n in 1:N)
    S[n] ~ normal((sT[n]*mu_U[review_U[n]]),sigma[review_U[N]]);
}  
