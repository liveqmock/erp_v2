/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2013/4/30 20:39:51                           */
/*==============================================================*/


DROP TABLE IF EXISTS BRAND;

DROP TABLE IF EXISTS CAT;

DROP TABLE IF EXISTS CUSTOMER;

DROP TABLE IF EXISTS CUSTOMER_ADDR;

DROP TABLE IF EXISTS LOGISTICS;

DROP TABLE IF EXISTS LOGISTICS_DETAIL;

DROP TABLE IF EXISTS PRODUCT;

DROP TABLE IF EXISTS REFOUND;

DROP TABLE IF EXISTS STORE;

DROP TABLE IF EXISTS STORE_IN;

DROP TABLE IF EXISTS STORE_OUT;

DROP TABLE IF EXISTS STORE_PRODUCT;

DROP TABLE IF EXISTS SYS_LOG;

DROP TABLE IF EXISTS TRADE;

DROP TABLE IF EXISTS TRADE_ORDER;

DROP TABLE IF EXISTS USER;

/*==============================================================*/
/* Table: BRAND                                                 */
/*==============================================================*/
CREATE TABLE BRAND
(
   ID                   BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键',
   NAME                 VARCHAR(128) NOT NULL COMMENT '品牌名称',
   LOGO                 VARCHAR(128) COMMENT 'logo uri',
   TIME_CREATE          TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
   TIME_UPDATE          TIMESTAMP COMMENT '更新时间',
   PARENT_ID            BIGINT COMMENT '父级品牌',
   PRIMARY KEY (ID)
)
TYPE = INNODB;

ALTER TABLE BRAND COMMENT '品牌';

/*==============================================================*/
/* Table: CAT                                                   */
/*==============================================================*/
CREATE TABLE CAT
(
   ID                   BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键',
   NAME                 VARCHAR(64) NOT NULL COMMENT '名称',
   DESCRIPTION          VARCHAR(1024) COMMENT '描述',
   TIME_CREATE          TIMESTAMP COMMENT '创建时间',
   TIME_UPDATE          TIMESTAMP COMMENT '更新时间',
   PARENT_ID            BIGINT COMMENT '父级分类',
   PRIMARY KEY (ID)
)
TYPE = INNODB;

ALTER TABLE CAT COMMENT '分类';

/*==============================================================*/
/* Table: CUSTOMER                                              */
/*==============================================================*/
CREATE TABLE CUSTOMER
(
   ID                   BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键',
   NAME                 VARCHAR(32) NOT NULL COMMENT '名字',
   NIKENAME             VARCHAR(32) COMMENT '昵称',
   EMAIL                VARCHAR(32) COMMENT '邮箱',
   QQ                   VARCHAR(32) COMMENT 'QQ',
   TEL                  VARCHAR(32) COMMENT '电话',
   MOBILE               VARCHAR(32) COMMENT '手机',
   TIME_CREATE          TIMESTAMP COMMENT '创建时间',
   TIME_UPDATE          TIMESTAMP COMMENT '更新时间',
   PRIMARY KEY (ID)
)
TYPE = INNODB;

ALTER TABLE CUSTOMER COMMENT '客户';

/*==============================================================*/
/* Table: CUSTOMER_ADDR                                         */
/*==============================================================*/
CREATE TABLE CUSTOMER_ADDR
(
   ID                   BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键',
   PROVINCE             VARCHAR(32) COMMENT '省',
   CITY                 VARCHAR(32) COMMENT '市',
   ADDR                 VARCHAR(256) COMMENT '地址',
   CONTACT_NAME         VARCHAR(64) COMMENT '收件人名称',
   ZIP                  VARCHAR(32) COMMENT '邮编',
   TEL                  VARCHAR(32) COMMENT '电话',
   MOBILE               VARCHAR(32) COMMENT '手机',
   TIME_CREATE          TIMESTAMP COMMENT '创建时间',
   TIME_UPDATE          TIMESTAMP COMMENT '更新时间',
   PRIMARY KEY (ID)
)
TYPE = INNODB;

ALTER TABLE CUSTOMER_ADDR COMMENT '客户地址';

/*==============================================================*/
/* Table: LOGISTICS                                             */
/*==============================================================*/
CREATE TABLE LOGISTICS
(
   ID                   BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键',
   COST                 BIGINT COMMENT '物流成本',
   LOGISTICS_COMPANY    VARCHAR(64) COMMENT '物流公司',
   INVOICE_NO           VARCHAR(64) COMMENT '运单号',
   BOND_OUT_FLAG        INT COMMENT '0, 为出关, 1 已出关',
   CUSTOMER_ID          INT COMMENT '收件人',
   CUSTOMER_ADDR_ID     BIGINT COMMENT '收件人地址',
   PRIMARY KEY (ID)
)
TYPE = INNODB;

ALTER TABLE LOGISTICS COMMENT '物流信息';

/*==============================================================*/
/* Table: LOGISTICS_DETAIL                                      */
/*==============================================================*/
CREATE TABLE LOGISTICS_DETAIL
(
   ID                   BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键',
   LOGISTICS_ID         BIGINT COMMENT '物流信息ID',
   TIME_CREATE          TIMESTAMP COMMENT '创建时间',
   TIME_UPDATE          TIMESTAMP,
   CONTENT              VARCHAR(5000) COMMENT '物流状态内容',
   PRIMARY KEY (ID)
)
TYPE = INNODB;

ALTER TABLE LOGISTICS_DETAIL COMMENT '物流信息明细';

/*==============================================================*/
/* Table: PRODUCT                                               */
/*==============================================================*/
CREATE TABLE PRODUCT
(
   ID                   BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键',
   CODE                 VARCHAR(128) COMMENT '货号',
   BAR_CODE             VARCHAR(128) COMMENT '二维码',
   NAME                 VARCHAR(128) COMMENT '名称',
   THUMB                VARCHAR(128) COMMENT '缩略图 URI',
   STOCK                BIGINT COMMENT '总库存',
   BRAND_ID             BIGINT COMMENT '品牌',
   CAT_ID               BIGINT COMMENT '分类',
   TIME_CREATE          TIMESTAMP COMMENT '创建时间',
   TIME_UPDATE          TIMESTAMP COMMENT '更新时间',
   PRIMARY KEY (ID)
)
TYPE = INNODB;

ALTER TABLE PRODUCT COMMENT '产品';

/*==============================================================*/
/* Table: REFOUND                                               */
/*==============================================================*/
CREATE TABLE REFOUND
(
   ID                   BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键',
   APPLY_USER_ID        BIGINT COMMENT '操作人',
   APPROVE_USER_ID      BIGINT COMMENT '审核人',
   QTY                  BIGINT COMMENT '总数量',
   OTHER_COST           BIGINT COMMENT '其他损耗',
   LOGISTICS_COST       BIGINT COMMENT '物流成本',
   LOGISTICS_NO         VARCHAR(64) COMMENT '物流单号',
   LOGISTICS_COMPANY    VARCHAR(128) COMMENT '物流公司',
   TIME_CREATE          TIMESTAMP COMMENT '创建时间',
   TIME_UPDATE          TIMESTAMP COMMENT '更新时间',
   TIME_APPLY           TIMESTAMP COMMENT '申请时间',
   TIME_APPROVED        TIMESTAMP COMMENT '审核时间',
   CUSTOMER_ID          BIGINT COMMENT '买家',
   APPROVED_STATUS      VARCHAR(32) COMMENT '审核状态(submit: 提交, refuse:拒绝)',
   REMARK               VARCHAR(1024) COMMENT '备注',
   STORE_OUT_ID         BIGINT COMMENT '对应的出货单',
   PRIMARY KEY (ID)
)
TYPE = INNODB;

ALTER TABLE REFOUND COMMENT '退货, 换货';

/*==============================================================*/
/* Table: STORE                                                 */
/*==============================================================*/
CREATE TABLE STORE
(
   ID                   BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键',
   NAME                 VARCHAR(64) COMMENT '仓库名',
   LOCATION             VARCHAR(512) COMMENT '地址',
   ENABLED              INT COMMENT '0 不可用, 1 可用',
   PRIMARY KEY (ID)
)
TYPE = INNODB;

ALTER TABLE STORE COMMENT '仓库';

/*==============================================================*/
/* Table: STORE_IN                                              */
/*==============================================================*/
CREATE TABLE STORE_IN
(
   ID                   BIGINT NOT NULL COMMENT '主键',
   APPLY_USER_ID        BIGINT COMMENT '操作人',
   APPROVE_USER_ID      BIGINT COMMENT '审核人',
   INPUT_TYPE           VARCHAR(32) COMMENT 'move: 库间调拨, new, 进货, refound, 退货入库',
   QTY                  BIGINT COMMENT '总数量',
   PROVIDER             VARCHAR(32) COMMENT '供应商',
   FROM_STORE           BIGINT COMMENT '来源仓库(库间调拨用)',
   TO_STORE             BIGINT COMMENT '入库仓库',
   COST                 BIGINT COMMENT '商品成本总和',
   LOGISTICS_COST       BIGINT COMMENT '物流成本',
   LOGISTICS_NO         VARCHAR(64) COMMENT '物流单号',
   LOGISTICS_COMPANY    VARCHAR(128) COMMENT '物流公司',
   TIME_CREATE          TIMESTAMP COMMENT '创建时间',
   TIME_UPDATE          TIMESTAMP COMMENT '更新时间',
   TIME_APPLY           TIMESTAMP COMMENT '申请时间',
   TIME_APPROVED        TIMESTAMP COMMENT '审核时间',
   APPROVED_STATUS      VARCHAR(32) COMMENT '审核状态(submit: 提交, refuse:拒绝)',
   REMARK               VARCHAR(1024) COMMENT '备注',
   PRIMARY KEY (ID)
)
TYPE = INNODB;

ALTER TABLE STORE_IN COMMENT '入库单';

/*==============================================================*/
/* Table: STORE_OUT                                             */
/*==============================================================*/
CREATE TABLE STORE_OUT
(
   ID                   BIGINT NOT NULL COMMENT '主键',
   APPLY_USER_ID        BIGINT COMMENT '操作人',
   APPROVE_USER_ID      BIGINT COMMENT '审核人',
   QTY                  BIGINT COMMENT '总数量',
   COST                 BIGINT COMMENT '商品成本总和',
   SALE                 BIGINT COMMENT '出售价格',
   LOGISTICS_COST       BIGINT COMMENT '物流成本',
   LOGISTICS_NO         VARCHAR(64) COMMENT '物流单号(冗余)',
   LOGISTICS_COMPANY    VARCHAR(128) COMMENT '物流公司(冗余)',
   LOGISTICS_ID         BIGINT COMMENT '物流信息ID',
   TIME_CREATE          TIMESTAMP COMMENT '创建时间',
   TIME_UPDATE          TIMESTAMP COMMENT '更新时间',
   TIME_APPLY           TIMESTAMP COMMENT '申请时间',
   TIME_APPROVED        TIMESTAMP COMMENT '审核时间',
   CUSTOMER_ID          BIGINT COMMENT '买家',
   CUSTOMER_ADDR_ID     BIGINT COMMENT '买家地址',
   APPROVED_STATUS      VARCHAR(32) COMMENT '审核状态(submit: 提交, refuse:拒绝)',
   REMARK               VARCHAR(1024) COMMENT '备注',
   PRIMARY KEY (ID)
)
TYPE = INNODB;

ALTER TABLE STORE_OUT COMMENT '出货单';

/*==============================================================*/
/* Table: STORE_PRODUCT                                         */
/*==============================================================*/
CREATE TABLE STORE_PRODUCT
(
   ID                   BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键',
   STORE_ID             BIGINT COMMENT '仓库id',
   PRODUCT_ID           BIGINT COMMENT '产品id',
   STOCK                BIGINT COMMENT '库存数',
   COST                 BIGINT COMMENT '成本',
   CURRENT_SALE         BIGINT COMMENT '当前淘宝售价',
   PRODUCTION_DATE      DATETIME COMMENT '生产日期',
   GUARANTEE_DATE       DATETIME COMMENT '保质期',
   BRAND_ID             BIGINT COMMENT '品牌',
   SALE_STATUS          INT COMMENT '状态(0 待售, 1 销售中, 2 下架)',
   TIME_CREATE          TIMESTAMP COMMENT '创建时间',
   TIME_UPDATE          TIMESTAMP COMMENT '更新时间',
   STORE_STATUS         INT COMMENT '库存状态0 申请, 1:在途, 2:入库)',
   INPUT_ID             BIGINT COMMENT '入库批次',
   TB_NUM_IID           BIGINT COMMENT '淘宝商品编号',
   PRIMARY KEY (ID)
)
TYPE = INNODB;

ALTER TABLE STORE_PRODUCT COMMENT '仓库商品明细';

/*==============================================================*/
/* Table: SYS_LOG                                               */
/*==============================================================*/
CREATE TABLE SYS_LOG
(
   ID                   BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键',
   USER_ID              BIGINT COMMENT '用户id',
   USER_REALNAME        VARCHAR(64) COMMENT '用户姓名',
   CONTENT              VARCHAR(5000) COMMENT '操作内容',
   IP                   VARCHAR(32) COMMENT 'ip',
   TIME_CREATE          TIMESTAMP COMMENT '创建时间',
   PRIMARY KEY (ID)
)
TYPE = INNODB;

ALTER TABLE SYS_LOG COMMENT '系统日志';

/*==============================================================*/
/* Table: TRADE                                                 */
/*==============================================================*/
CREATE TABLE TRADE
(
   ID                   BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键',
   NUM                  INT COMMENT '购买数量',
   NUM_IID              BIGINT COMMENT '商品数字编号',
   STATUS               VARCHAR(32) COMMENT '交易状态',
   TITLE                VARCHAR(128) COMMENT '交易标题',
   PRICE                BIGINT COMMENT '商品价格',
   BUYER_NICK           VARCHAR(64) COMMENT '买家昵称',
   CUSTOMER_ID          BIGINT COMMENT '买家信息',
   RECEIVED_PAYMENT     BIGINT COMMENT '实付金额',
   AVAILABLE_CONFIRM_FEE BIGINT COMMENT '交易中剩余的确认收货金额',
   TIMEOUT_ACTION_TIME  DATETIME COMMENT '超时到期时间',
   LOCAL_STATUS         INT COMMENT '0, 手工拆分, 1, 手工合并, 2, 本地订单',
   LOCAL_REF_TRADE      BIGINT COMMENT '指向本地订单的主键',
   LOCAL_STORE_PRODUCT_ID BIGINT COMMENT '本地商品ID',
   LOGISTICS_COST       BIGINT COMMENT '物流费',
   PRIMARY KEY (ID)
)
TYPE = INNODB;

ALTER TABLE TRADE COMMENT '订单';

/*==============================================================*/
/* Table: TRADE_ORDER                                           */
/*==============================================================*/
CREATE TABLE TRADE_ORDER
(
   ID                   BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键',
   STATUS               VARCHAR(32) COMMENT '订单状态',
   TITLE                VARCHAR(64) COMMENT '商品标题',
   NUM_IID              BIGINT COMMENT '商品数字ID',
   PRICE                BIGINT COMMENT '商品价格',
   PAYMENT              BIGINT COMMENT '子订单实付金额',
   LOCAL_STORE_PRODUCT_ID BIGINT COMMENT '本地商品ID',
   TRADE_ID             BIGINT COMMENT '交易id',
   LOGISTICS_ID         BIGINT COMMENT '物流信息ID',
   PRIMARY KEY (ID)
)
TYPE = INNODB;

ALTER TABLE TRADE_ORDER COMMENT '订单详细';

/*==============================================================*/
/* Table: USER                                                  */
/*==============================================================*/
CREATE TABLE USER
(
   ID                   BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键',
   LOGIN_NAME           VARCHAR(32) NOT NULL COMMENT '登录名',
   NAME                 VARCHAR(32) COMMENT '名字',
   REALNAME             VARCHAR(64) COMMENT '真实姓名',
   EMAIL                VARCHAR(32) COMMENT '邮箱',
   PASSWORD             VARCHAR(128) NOT NULL COMMENT '密码',
   MOBILE               VARCHAR(32) COMMENT '手机',
   REG_IP               VARCHAR(32) COMMENT '注册ip',
   LAST_IP              VARCHAR(32) COMMENT '最后一次登录ip',
   TIME_LOGIN           TIMESTAMP COMMENT '登录时间',
   TIME_CREATE          TIMESTAMP COMMENT '创建时间',
   TIME_UPDATE          TIMESTAMP COMMENT '更新时间',
   STATUS               VARCHAR(10) COMMENT 'normal:正常, lock: 锁定, disable: 禁用delete:删除',
   PRIMARY KEY (ID)
)
TYPE = INNODB;

ALTER TABLE USER COMMENT '系统用户';

