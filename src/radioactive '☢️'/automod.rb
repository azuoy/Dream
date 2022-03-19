
<configuration>
    <appender name="FILE" class="ch.qos.logback.core.rolling.RollingFileAppender">
        <rollingPolicy class="ch.qos.logback.core.rolling.TimeBasedRollingPolicy">
            <!-- daily rollover -->
            <fileNamePattern>logs/log.%d{yyyy-MM-dd}.txt</fileNamePattern>

            <!-- keep 30 days' worth of history capped at 1GB total size -->
            <maxHistory>30</maxHistory>
            <totalSizeCap>1GB</totalSizeCap>
        </rollingPolicy>
        <encoder>
            <!-- author: Kaidan Gustave  -->
            <pattern> 
                %nopex[%d{HH:mm:ss}] [%level] [%logger{0}]: %msg%n%ex
            </pattern>
        </encoder>
    </appender>

    <root level="INFO">
        <appender-ref ref="FILE"/>
    </root>
</configuration>
