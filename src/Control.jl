function calculate_transcriptional_control_array(t::Float64,x::Array{Float64,1}, problem::Dict{String,Any})::Float64

    # initialize -
    u_variable = 0.0
    
    # alias elements of the species vector -
    mRNA = x[1]
    G = x[2]
    σ70 = x[3]

    # get stuff from the problem dictionary -
    E1 = problem["E1"]
    E2 = problem["E2"]
    R = problem["ideal_gas_constant_R"]
    T_K = problem["temperature_K"]
    KD = problem["inducer_dissociation_constant"]
    n = problem["inducer_cooperativity_parameter"]

    # TODO: write u-varible function here 
    f_I = σ70^n / (KD + σ70^n)
    Z = 1 + exp(-E1/(R*T_K)) + f_I * exp(-E2/(R*T_K))
    u_variable = ( exp(-E1/(R*T_K)) + f_I * exp(-E2/(R*T_K)) ) / Z

    # return -
    return u_variable
end
