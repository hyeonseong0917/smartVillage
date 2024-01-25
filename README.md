# smartVillage
## 디렉토리 구조
├─java

│      ├─smartVillage

│      │  └─usr
│      │      ├─board
│      │      │  └─web
│      │      │          BoardController.java
│      │      │

│      │      ├─carCare
│      │      │  ├─dao
│      │      │  │      CarCareDAO.java
│      │      │  │

│      │      │  ├─entity
│      │      │  │      CarRegist.java
│      │      │  │      ChargeHist.java
│      │      │  │

│      │      │  ├─service
│      │      │  │  │  CarCareService.java
│      │      │  │  │

│      │      │  │  └─impl
│      │      │  │          CarCareServiceImpl.java
│      │      │  │

│      │      │  ├─vo
│      │      │  │      CarInOutVo.java
│      │      │  │

│      │      │  └─web
│      │      │          CarCareController.java
│      │      │

│      │      ├─cctv
│      │      │  ├─dao
│      │      │  │      CctvDAO.java
│      │      │  │

│      │      │  ├─service
│      │      │  │  │  CctvService.java
│      │      │  │  │

│      │      │  │  └─impl
│      │      │  │          CctvServiceImpl.java
│      │      │  │

│      │      │  └─web
│      │      │          CctvController.java
│      │      │

│      │      ├─environment
│      │      │  ├─dao
│      │      │  │      EnvironmentDAO.java
│      │      │  │

│      │      │  ├─service
│      │      │  │  │  EnvironmentService.java
│      │      │  │  │

│      │      │  │  └─impl
│      │      │  │          EnvironmentServiceImpl.java
│      │      │  │

│      │      │  ├─vo
│      │      │  │      InvironmentInfoVO.java
│      │      │  │

│      │      │  └─web
│      │      │          EnvironmentController.java
│      │      │

│      │      └─waterEnergy
│      │          ├─dao
│      │          │      WaterEnergyDAO.java
│      │          │

│      │          ├─service
│      │          │  │  WaterEnergyService.java
│      │          │  │

│      │          │  └─impl
│      │          │          WaterEnergyServiceImpl.java
│      │          │

│      │          ├─vo
│      │          │      ExportChartVo.java
│      │          │      ExportVo.java
│      │          │      UsageChartVo.java
│      │          │      UsageVo.java
│      │          │

│      │          └─web
│      │                  WaterEnergyController.java
│      │

│      ├─sqlmap

│      │  └─smartVillage
│      │      └─usr
│      │          ├─carCare
│      │          │      CarCare_SQL.xml
│      │          │

│      │          ├─cctv
│      │          │      Cctv_SQL.xml
│      │          │

│      │          ├─environment
│      │          │      Environment_SQL.xml
│      │          │

│      │          └─waterEnergy
│      │                  WaterEnergy_SQL.xml
│      │
│

└─webapp

│  │  └─smartVillage
│  │      ├─common
│  │      │      login.jsp
│  │      │      main.jsp
│  │      │      signIn.jsp
│  │      │

│  │      └─usr
│  │          ├─board
│  │          │      boardForm.jsp
│  │          │      boardList.jsp
│  │          │      boardReplyView.jsp
│  │          │      boardView.jsp
│  │          │

│  │          ├─carCare
│  │          │      carCare.jsp
│  │          │

│  │          ├─cctv
│  │          │      cctv.jsp
│  │          │

│  │          ├─environment
│  │          │      fineDust.jsp
│  │          │      humidity.jsp
│  │          │      ilumination.jsp
│  │          │      noisePollution.jsp
│  │          │      temperature.jsp
│  │          │      ultraParticles.jsp
│  │          │

│  │          └─waterEnergy
│  │                  cooling.jsp
│  │                  electric.jsp
│  │                  heating.jsp
│  │                  hotWater.jsp
│  │                  water.jsp