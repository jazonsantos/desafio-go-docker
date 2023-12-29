# Use a imagem oficial do Go para compilar
FROM golang:1.21.5 AS builder

# Defina o diretorio de trabalho dentro do conteiner
WORKDIR /desafio-go-docker

# Copie o codigo-fonte para o diretorio de trabalho
COPY . .

# Compilar o programa go 
RUN go build desafio-docker.go 

# Estágio final
#IMAGEM sendo alpine:latest ficou com 9.18 MB 
#FROM alpine:latest
FROM scratch

WORKDIR /app

#Copiar o executavel do estagio de compilacao para o diretorio de trabalho no estagio final
COPY --from=builder /desafio-go-docker/desafio-docker .

# Comando para executar o programa quando o conteiner iniciar
CMD ["./desafio-docker"]
