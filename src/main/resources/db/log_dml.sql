-- 菜单SQL
INSERT INTO `sys_menu` ( parent_id, name, url, perms, `type`, icon, order_no, create_time, update_time, status)
    VALUES ('1', '系统日志', 'modules/generator/${pathName}.html', NULL, '1', 'fa fa-file-code-o', '6');
VALUES(1, '系统日志', 'sys/log', 'sys:log:log', 1, 'fa fa-user-secret', 12, '2019-01-01 00:00:00.000', NULL, '1');

-- 按钮父菜单ID
set @parentId = @@identity;

-- 菜单对应按钮SQL
INSERT INTO `sys_menu` 
(parent_id, name, url, perms, `type`, icon, order_no, create_time, update_time, status)
SELECT(5, '新增', '', '${pathName}:list,${pathName}:add', 2, '', 0, '2019-01-01 00:00:00.000', NULL, '1');
INSERT INTO `sys_menu` 
(parent_id, name, url, perms, `type`, icon, order_no, create_time, update_time, status)
SELECT(5, '编辑', '', '${pathName}:list,${pathName}:edit', 2, '', 0, '2019-01-01 00:00:00.000', NULL, '1');
INSERT INTO `sys_menu` 
(parent_id, name, url, perms, `type`, icon, order_no, create_time, update_time, status)
SELECT(5, '删除', '', '${pathName}:list,${pathName}:remove', 2, '', 0, '2019-01-01 00:00:00.000', NULL, '1');
INSERT INTO `sys_menu` 
(parent_id, name, url, perms, `type`, icon, order_no, create_time, update_time, status)
SELECT(5, '导出', '', '${pathName}:list,${pathName}:export', 2, '', 0, '2019-01-01 00:00:00.000', NULL, '1');
