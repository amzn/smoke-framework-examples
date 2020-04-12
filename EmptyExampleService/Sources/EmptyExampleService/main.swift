//
// main.swift
// EmptyExampleService
//

import SmokeHTTP1
import SmokeOperationsHTTP1Server

SmokeHTTP1Server.runAsOperationServer(EmptyExamplePerInvocationContextInitializer.init)
