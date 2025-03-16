if type -q kubectl
    kubectl completion fish | source
end

if type -q minikube
    minikube completion fish | source
end
