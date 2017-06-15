v1 <- rep(1:4, each = 8)
v2 <- rep(rep(1:4, each = 2), 4)
v3 <- rep(1:4, 8)
  
payload1 <- sample(1:100, 32)
payload2 <- sample(1:100, 32)

df <- data.frame(v1, v2, v3, payload1, payload2)

# -------------------------------------------------------------------------------------------------
# Aggregation of data grouped by V1
# - Vectors v1, v2, v3 are _not_ factors

agg <- aggregate(df[c("v1","payload1")], by = list(df$v1), FUN = sum)


# -------------------------------------------------------------------------------------------------
# Aggregation of payload data grouped by V1
# - Vectors v1, v2, v3 are factors
df$v1 <- as.factor(df$v1)
df$v2 <- as.factor(df$v2)
df$v3 <- as.factor(df$v3)

agg <- aggregate(payload1 ~ v1, df, FUN = sum)

# -------------------------------------------------------------------------------------------------
# Aggregation of payload data grouped by V1 and V2
agg <- aggregate(payload1 ~ v1 + v2, df, FUN = sum)

# -------------------------------------------------------------------------------------------------
# Aggregation of multiple payloads data grouped by V1 and V2
agg <- aggregate(cbind(payload1, payload2) ~ v1 + v2, df, FUN = sum)


