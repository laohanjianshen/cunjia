package com.cunjia.ordering.config;

import org.springframework.context.annotation.Bean;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.TransactionManagementConfigurer;

import javax.annotation.Resource;
import javax.sql.DataSource;

/**
 * 自定义事务 hyf
 */
public class ManagerTransactional implements TransactionManagementConfigurer {
    @Resource
    private PlatformTransactionManager platformTransactionManager;
    @Override
    public PlatformTransactionManager annotationDrivenTransactionManager() {
        return platformTransactionManager;
    }

    // 创建事务管理器
    @Bean
    public PlatformTransactionManager txManager(DataSource dataSource) {
        return new DataSourceTransactionManager(dataSource);
    }
}
