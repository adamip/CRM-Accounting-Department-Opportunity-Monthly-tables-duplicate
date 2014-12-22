USE Productions_MSCRM;
/*
DROP TABLE bkup_OpportunityBase_20141130;
DROP TABLE bkup_OpportunityExtensionBase_20141130;
DROP TABLE bkup_new_ProjectBase_20141130;
DROP TABLE bkup_new_ProjectExtensionBase_20141130;
DROP TABLE bkup_cust_ProjectMilestonesBase_20141130;
DROP TABLE bkup_cust_ProjectMilestonesExtensionBase_20141130;
DROP TABLE bkup_cust_ProjectMilestoneTimeBase_20141130;
DROP TABLE bkup_cust_ProjectMilestoneTimeExtensionBase_20141130;

*/
BEGIN TRANSACTION T1;
SELECT * INTO DBO.bkup_OpportunityBase_20141130 FROM DBO.OpportunityBase;
SELECT * INTO DBO.bkup_OpportunityExtensionBase_20141130 FROM DBO.OpportunityExtensionBase;  
COMMIT TRANSACTION T1;

BEGIN TRANSACTION T2;
SELECT * INTO DBO.bkup_new_ProjectBase_20141130 FROM DBO.new_ProjectBase;
SELECT * INTO DBO.bkup_new_ProjectExtensionBase_20141130 FROM DBO.new_ProjectExtensionBase;  
COMMIT TRANSACTION T2;

BEGIN TRANSACTION T3;
SELECT * INTO DBO.bkup_cust_ProjectMilestonesBase_20141130 FROM DBO.cust_ProjectMilestonesBase;
SELECT * INTO DBO.bkup_cust_ProjectMilestonesExtensionBase_20141130 FROM DBO.cust_ProjectMilestonesExtensionBase;  
COMMIT TRANSACTION T3;

BEGIN TRANSACTION T4;
SELECT * INTO DBO.bkup_cust_ProjectMilestoneTimeBase_20141130 FROM DBO.cust_ProjectMilestoneTimeBase;
SELECT * INTO DBO.bkup_cust_ProjectMilestoneTimeExtensionBase_20141130 FROM DBO.cust_ProjectMilestoneTimeExtensionBase;  
COMMIT TRANSACTION T4;

SELECT Opp.*, Ext.*
	FROM DBO.bkup_OpportunityBase_20141130 AS Opp, DBO.bkup_OpportunityExtensionBase_20141130 AS Ext
	WHERE Opp.OpportunityID = Ext.OpportunityID
	ORDER BY Opp.Name;
	
SELECT Proj.*, Ext.*
	FROM DBO.bkup_new_ProjectBase_20141130 AS Proj, DBO.bkup_new_ProjectExtensionBase_20141130 AS Ext
	WHERE Proj.new_projectId = Ext.new_projectId
	ORDER BY Ext.new_title;
	
SELECT ms.*, Ext.*
	FROM DBO.bkup_cust_projectMilestonesBase_20141130 AS ms, DBO.bkup_cust_projectMilestonesExtensionBase_20141130 AS Ext
	WHERE ms.cust_projectMilestonesId = Ext.cust_projectMilestonesId
	ORDER BY Ext.cust_Milestones;	
	
SELECT tm.*, Ext.*
	FROM DBO.bkup_cust_projectMilestoneTimeBase_20141130 AS tm, DBO.bkup_cust_ProjectMilestoneTimeExtensionBase_20141130 AS Ext
	WHERE tm.cust_projectMilestoneTimeId = Ext.cust_projectMilestoneTimeId
	ORDER BY Ext.cust_name;		