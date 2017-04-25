include("naive.bayes-stan.data.jl")
include("naive.bayes.model.jl")

bench_res = tbenchmark("HMC(1000, 0.1, 3)", "nbmodel", "data=nbstandata[1]")
bench_res[4].names = ["phi[1]", "phi[2]", "phi[3]", "phi[4]"]
logd = build_logd("Naive Bayes", bench_res...)

include("naive.bayes-stan.run.jl")
logd["stan"] = stan_d
logd["time_stan"] = nb_time

print_log(logd)
