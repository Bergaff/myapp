import 'dart:math';

class GameLogic {
  final Map<String, String> steelGrades = {
    "У10":
        "инструмент, работающий в условиях, не вызывающих разогрева режущей кромки: метчики ручные, рашпили, надфили, пилы для обработки древесины, матрицы для холодной штамповки, гладкие калибры, топоры.",
    "У12":
        "режущие инструменты, работающие в условиях, не вызывающих разогрева режущей кромки: метчики ручные, метчики машинные мелкоразмерные, плашки для круппов, развертки мелкоразмерные, надфили, измерительный инструмент простой формы: гладкие калибры, скобы.",
    "У7":
        "инструмент, который работает в условиях, не вызывающих разогрева рабочей кромки: зубила, долота, бородки, молотки, лезвия ножниц для резки металла, топоры, колуны, стамески, плоскогубцы комбинированные, кувалды.",
    "У8Г": "для производства пружинной ленты",
    "13Х":
        "для бритвенных ножей и лезвий, острого хирургического инструмента, шаберов, гравировального инструмента",
    "5ХВ2СФ":
        "ножи для холодной резки металла, резьбонакатные плашки, пуансоны и обжимные матрицы при холодной работе;деревообделочные инструменты при длительной работе",
    "6Х4М2ФС":
        "для вырубного и высадочного инструмента (штампов, пуасонов, пневматических зубил и др.), накатного инструмента",
    "8Х6НФТ":
        "для ножей, применяемых для фрезерования древесины, строгальных пил и других деревообрабатывающих инструментов",
    "9Х5ВФ":
        "для ножей, применяемых для фрезерования древесины, строгальных пил и других деревообрабатывающих инструментов",
    "9ХФМ": "дисковые и рамные деревообрабатывающие пилы",
    "ХВ4Ф":
        "резцы и фрезы при обработке с небольшой скоростью резания твердых металлов (валки с закаленной поверхностью), гравировальные резцы при очень напряженной работе, прошивные пуансоны и т. д",
    "ХГС":
        "для валков холодной прокатки, холодновысадочных матриц и пуасонов, вырубных штампов небольших размеров",
    "45ХНМ":
        "оси составных опорных валков листовых станов для горячей прокатки металлов, шестеренные валы и другие.",
    "60ХН":
        "рабочие валки блюмингов, слябингов, заготовочных, рельсобалочных и крупносортных станов, рабочие опорные валки листовых станов для горячей прокатки металлов.",
    "75ХСМФ": "рабочие валки листовых станов для холодной прокатки металлов.",
    "9Х2":
        "рабочие и опорные валки двух- и четырехвалковых клетей листовых станов для холодной прокатки металлов. Рабочие и опорные кованые валки листовых станов для горячей прокатки металлов.",
    "27Х2Н2М1Ф":
        "ответственные детали прессового инструмента с повышенными свойствами прочности и повышенной пластичностью после нормализации и отпуска: втулки контейнеров, кольца, пресс-штемпели, иглы и другие детали, работающие при высоких температурах",
    "3Х3М3Ф":
        "инструмент горячего деформирования на кривошипных прессах и гориэонтально-ковочннх машинах, подвергающийся в процессе работы интенсивному охлаждению (как правило, для мелкого инструмента), пресс-формы литья под давлением медных сплавов, ножи для горячей резки, охлаждаемые водой.",
    "4Х3ВМФ":
        "для мелких молотовых штампов, молотовых и прессовых вставок (толщиной или диаметром от 300 0-400 мм), инструмента горизонтальноковочных машин при горячем деформировании конструкционных и жаропрочных сталей; инструмента для высокоскоростной машинной штамповки конструкционных сталей",
    "4Х5МФС":
        "мелкие молотовые штампы, крупные (сечением более 200 мм) молотовые и прессовые вставки при горячем деформировании конструкционных сталей и цветных сплавов в условиях крупносерийного и массового производства, пресс-формы литья под давлением алюминиевых, а также цинковых и магниевых сплавов.",
    "5Х3В3МФС":
        "для тяжелонагруженного прессового инструмента ( матриц, прошивных и формующих пуансонов и т.п.); инструмента для высадки на горизонтальноковочных машинах и вставок штампов напряженных конструкций, для горячего объемного деформирования легированых конструкционных сталей и жаропрочных сплавов при горячем деформировании легированных конструкционных сталей и жаропрочных сплавов",
    "6ХВ2С":
        "ножи для холодной резки металла, резьбонакатные плашки, пуансоны и обжимные матрицы при холодной работе, штампы сложной формы, работающие с повышенными ударными нагрузками.",
    "7ХГ2ВМ":
        "для изготовления штампов холодного объемного деформирования, используемых при производстве изделий из цветных сплавов и малопрочных конструкционных сталей; пуансонов, матриц вырубных штампов сложной конфигурации",
    "Х12":
        "холодные штампы высокой устойчивости против истирания, не подвергающиеся сильным ударам и толчкам; волочильные доски, глазки для калибрования пруткового металла под накатку резьбы, гибочные и формовочные штампы, сложные секции кузовных штампов, матриц и пуансонов вырубных и просечных штампов, штамповки активной части электрических машин и т. д.",
    "Х12МФ":
        "профилировочные ролики сложных форм, секции кузовных штампов сложных форм, сложные дыропрошивные матрицы при формовке листового металла, эталонные шестерни, накатные плашки, волоки, матрицы и пуансоны вырубных просечных штампов со сложней конфигурацией рабочих частей, штамповки активной части электрических машин.",
    "11М5Ф": "для изготовления инструмента",
    "Р12":
        "для всех видов режущего инструмента при обработке углеродистых легированных конструкционных сталей",
    "Р18К5Ф2":
        "для черновых и получерновых инструментов при обработке высокопрочных, нержавеющих и жаропрочных сталей и сплавов",
    "Р2М5": "для изготовления инструмента",
    "Р6М5Ф3":
        "для чистовых и получистовых инструментов при обработке нелегированных и легированных конструкционных сталей",
    "Р9М4К8":
        "для обработки высокопрочных нержавеющих и жаропрочных сталей и сплавов в условиях повышенного разогрева режущей кромки: зуборезный инструмент, фрезы, фасонные резцы, зенкеры, метчики.",
    "У10А":
        "инструмент, работающий в условиях, не вызывающих разогрева режущей кромки: метчики ручные, рашпили, надфили, пилы для обработки древесины, матрицы для холодной штамповки, гладкие калибры, топоры.",
    "У12А":
        "режущие инструменты, работающие в условиях, не вызывающих разогрева режущей кромки: метчики ручные, метчики машинные мелкоразмерные, плашки для круппов, развертки мелкоразмерные, надфили, измерительный инструмент простой формы: гладкие калибры, скобы.",
    "У7А":
        "инструмент, который работает в условиях, не вызывающих разогрева рабочей кромки: зубила, долота, бородки, молотки, лезвия ножниц для резки металла, топоры, колуны, стамески, плоскогубцы комбинированные, кувалды.",
    "У8ГА": "для производства пружинной ленты",
    "3Х2МНФ":
        "крупные молотовые штампы; штампы-контейнеры; кольца-бандажи; крупные внутренние втулки",
    "5ХНВ":
        "для молотовых штампов паровоздушных и пневматических молотов с массой падающих частей 0-3 тонн",
    "6Х6В3МФС":
        "для резьбонакатных роликов, зубонакатников,обрезных матриц и др. инструментов, приедназначенных для холодной пластической деформации металлов повышенной твердости; ножей труборазрубочных машин, ножей гильотинных ножниц для резки высокопрочных сталей и сплавов; рубильных ножей, применяемых в деревообрабатывающей промышленнности; шарошек для разрушения горных пород и других аналогичных инструментов",
    "8ХФ":
        "для штемпелей при холодной работе; ножей при холодной резке металла, обрезных матриц и пуассонов при холодной обрезке заусенцев; кернеров",
    "9ХВГ":
        "резьбовые калибры, лекала сложной формы, сложные весьма точные штампы для холодных работ, которые при закалке не должны подвергаться значительным объемным изменениям и короблению.",
    "В2Ф": "для ленточных пил по металлу и ножовочных полотен",
    "ХВГ":
        "измерительный и режущий инструмент, для которого повышенное коробление при закалке недопустимо, резьбовые калибры, протяжки, длинные метчики, длинные развертки и другой вид специального инструмента, холодновысадочные матрицы и пуансоны, технологическая оснастка.",
    "55Х":
        "оси составных опорных валков для холодной прокатки металлов. Рабочие валки блюмингов, слябингов, заготовочных, рельсобалочных, крупносортных, среднесортных и мелкосортных станов и рабочие валки листовых станов для горячей прокатки металлов. Редукторные валы, шестерни и другие нагруженные детали, подвергающиеся истиранию, но работающие без значительных ударных нагрузок.",
    "60ХСМФ":
        "рабочие валки двух - и четырехвалковых клетей листовых станов для холодной прокатки металлов.",
    "7Х2СМФ": "рабочие валки кованые для холодной прокатки металлов.",
    "9Х2МФ":
        "рабочие валки для станов холодной прокатки металлов при особо тяжелых условиях эксплуатации, рабочие валки проволочных обжимных и сортовых станов",
    "2Х6В8М2К8":
        "иглы, пуансоны для прессования жаропрочных и коррозионно-стойких сталей и сплавов, а также титановых сплавов при температурах 0-650-675 град.С, выполняемых без интенсивного охлаждения",
    "40Х5МФ":
        "ответственные детали прессового и штампового инструмента с высокими свойствами прочности после нормализации и отпуска: втулки контейнеров, кольца, пресс-штемпели, иглы и другие детали, работающие при температурах 0-500 °С.",
    "4Х4ВМФС":
        "для инструмента высокоскоростной машинной штамповки, высадки на горизонтальноковочных машинах; вставок штампов для горячего деформирования легированых конструкционных сталей и жаропрочных сплавов на молотах и кривошипных прессах; пресс-форм литья под давлением медных сплавов",
    "4ХВ2С":
        "пневматический инструмент: зубила, обжимки, вырубные и обрезные штампы сложной формы, работающие с повышенными ударными нагрузками.",
    "5ХВ2С":
        "ножи при холодной резке металла, резьбонакатные плашки, пуансоны и обжимные матрицы при холодной работе, штампы сложной формы, работающие с повышенными ударными нагрузками.",
    "6ХВГ":
        "пуансоны сложной формы для холодной прошивки преимущественно фигурных отверстий в листовом и полосовом материале, небольшие штампы для горячей штамповки, главным образом, когда требуется минимальное изменение размеров при закалке.",
    "7ХГ2ВМФ":
        "штампы объемного холодного деформирования и вырубной инструмент сложной конфигурации, используемые при производстве изделий из цветных сплавов и малопрочных конструкционных сталей.",
    "Х12ВМ":
        "холодные штампы высокой устойчивости против истирания, не подвергающиеся сильным ударам и толчкам, волочильные доски и волоки, глазки для калибрования пруткового металла под накатку резьбы, гибочные и формовочные штампы, сложные кузовные штампы, матрицы и пуансоны вырубных и просечных штампов, штамповки активной части электрических машин,",
    "Х12Ф1":
        "профилировочные ролики сложной формы, эталонные шестерни, накатные плашки, волоки, секции кузовных штампов сложной формы, сложные дыропрошивные матрицы при формовке листового металла, матрице и пуансоны вырубных и просечных штампов со сложной конфигурацией рабочих частей, пуансоны и матрицы холодного выдавливания, работающие при давлении 0-1400—1600 МПа.",
    "11Р3АМ3Ф2":
        "для инструмента простой формы при обработке углеродистых и малолегированных сталей",
    "Р12Ф3":
        "для чистовых инструментов при обработке вязкой аустенитной стали и материалов, обладающих абразивными свойствами",
    "Р18Ф2":
        "для изготовления чистовых и получистовых режущих инструментов при обработке среднелегированных конструкционных сталей",
    "Р6М3":
        "для изготовления чистовых и получистовых инструментов небольших размеров при обработке конструкционных сталей",
    "Р9":
        "для изготовления инструментов простой формы, не требующих большого объема шлифовки, для обработки обычных конструкционных материалов.",
    "Р9Ф5":
        "для изготовления инструментов простой формы, не требующих больших объемов шлифовальных операций при обработке материалов с повышенными абразивными свойствами; чистовых инструментов простой формы при обработке легированных сталей и сплавов",
    "У11":
        "для инструмента простой формы при обработке углеродистых и малолегированных сталей",
    "У13":
        "инструменты повышенной износостойкости, работающие при умеренных и значительных давлениях без разогрева режущей кромки",
    "У8":
        "для инструмента, работающего в условиях, не вызывающих разогрева режущей кромки: фрез, зенковок, топоров, стамесок, долот, пил продольных и дисковых, накатных роликов, кернеров, отверток, комбинированных плоскогубцев, боковых кусачек.",
    "У9":
        "инструмент, работающий в условиях, не вызывающих разогрева кромки: инструмент для обработки дерева, слесарно-монтажный инструмент, калибры простой формы и пониженных классов точности.",
    "11ХФ":
        "для метчиков и другого режущего инструмента диаметром 0-30 мм, закаливаемого с охлаждением в горячих средах",
    "4ХМНФС": "для молотовых штампов, бандажей и матриц",
    "5ХНВС":
        "для молотовых штампов паровоздушных и пневматических молотов с массой падающих частей 0-3 тонн",
    "7ХФ": "для изготовления деревообрабатывающих инструментов",
    "9Г2Ф": "для режущего и штамповочного инструмента",
    "9ХС":
        "сверла, развертки, метчики, плашки, гребенки, фрезы, машинные штампели, клейма для холодных работ. Ответственные детали, материал которых должен обладать повышенной износостойкостью, усталостной прочностью при изгибе, кручении, контактном нагружении, а также упругими свойствами.",
    "Х":
        "для зубил, применяемых при насечке напильников; очень твердых кулачков эксцентриков и пальцев; гладких цилиндрических калибров и калиберных колец; токарных, строгальных и долбежных резцов в лекальных и ремонтных мастерских",
    "ХВСГ":
        "для изготовления инструментов, предназначенных для ручной работы; холодновысадочных матриц и пуассонов; технологической оснастки; деревообрабатывающих инструментов; ножей для бумажной промышленности",
    "60Х2СМФ":
        "рабочие валки двух - и четырехвалковых клетей листовых станов для холодной прокатки металлов.",
    "75ХМ":
        "рабочие и опорные валки листовых станов для горячей прокатки черных металлов, опорные валки двух- и четырехвалковых клетей листовых станов для холодной прокатки металлов.",
    "90ХМФ":
        "опорные валки всех размеров и бандажи составных опорных валков листовых станов для горячей прокатки металлов.",
    "3Х2В8Ф":
        "тяжелонагруженный прессовый инструмент (мелкие вставки окончательного штампового ручья, матрицы и пуансоны для выдавливания и т. д.) при горячем деформировании легированных конструкционных сталей и жаропрочных сплавов, пресс-формы литья под давлением медных сплавов.",
    "4Х2В5МФ":
        "для тяжелонагруженного прессового инструмента (мелких вставок окончательного штампового ручья, мелких вставных знаков, матриц и пуансонов для выдавливания и т.п.) при горячем деформировании легированных конструкционных сталей и жаропрочных сплавов",
    "4Х5В2ФС":
        "пресс-формы литья под давлением цинковых, алюминиевых и магниевых сплавов, молотовые и прессовые вставки (сечением 0-200—250 мм) при горячем деформировании конструкционных сталей, инструмент для высадки заготовок из легированных конструкционных и жаропрочных материалов на горизонтально-ковочных машинах.",
    "4ХМФС":
        "молотовые штампы паровоздушных и пневматических молотов с массой падающих частей 0-3 т при деформации легированных конструкционных и нержавеющих сталей, прессовый инструмент для обработки алюминиевых сплавов, вставки и пуансоны для высадки на горизонтально-ковочных машинах.",
    "5ХГМ":
        "молотовые штампы паровоздушных и пневматических молотов с массой падающих частей 0-3 т, ковочные штампы для горячей штамповки, валки крупных, средних и мелкосортных станов для прокатки твердого металла.",
    "6ХС":
        "пневматические зубила и штампы небольших размеров для холодной штамповки, рубильные ножи.",
    "8Х3":
        "инструмент (пуансоны, матрицы) горячей высадки крепежа и заготовок из углеродистых и низколегированных конструкционных сталей на горизонтально-ковочных машинах, детали штампов (матрицы, пуансоны, выталкиватели) для горячего прессования и выдавливания, гибочные и просечные штампы",
    "Х12ВМФ":
        "холодные штампы высокой устойчивости против истирания, не подвергающиеся сильным ударам и толчкам; волочильные доски, глазки для калибрования пруткового металла под накатку резьбы, гибочные и формовочные штампы, сложные секции кузовных штампов, матриц и пуансонов вырубных и просечных штампов, штамповки активной части электрических машин и т. д.",
    "Х6ВФ":
        "резьбокатаный инструмент (ролики и плашки), ручные ножовочные полотна, бритвы, матрицы, пуансоны, зубонакатники и другие инструменты, предназначенные для холодной деформации, для дереворежущего фрезерного инструмента.",
    "Р14Ф4":
        "для изготовления инструментов простой формы, не требующих больших объемов шлифовальных операций при обработке материалов с повышенными абразивными свойствами; чистовых инструментов простой формы при обработке легированных сталей и сплавов",
    "Р18Ф2К5":
        "для изготовления получистовых и черновых инструментов при обработке углеродистых и легированных конструкционных сталей на повышенных режимах резания",
    "Р6М5":
        "для всех видов режущего инструмента при обработке углеродистых легированных конструкционных сталей; предпочтительно для изготовления резьбонарезного инструмента, а также инструмента, работающего с ударными нагрузками",
    "Р9К10":
        "для изготовления получистовых и черновых инструментов при обработке углеродистых и легированных конструкционных сталей на повышенных режимах резания",
    "У11А":
        "метчики ручные, рашпили, надфили, пилы для обработки древесины, матрицы для холодной штамповки, топоры, калибры простой формы и пониженных классов точности",
    "У13А":
        "инструменты повышенной износостойкости, работающие при умеренных и значительных давлениях без разогрева режущей кромки",
    "У8А":
        "для инструмента, работающего в условиях, не вызывающих разогрева режущей кромки: фрез, зенковок, топоров, стамесок, долот, пил продольных и дисковых, накатных роликов, кернеров, отверток, комбинированных плоскогубцев, боковых кусачек.",
    "У9А":
        "инструмент, работающий в условиях, не вызывающих разогрева кромки: инструмент для обработки дерева, слесарно-монтажный инструмент, калибры простой формы и пониженных классов точности.",
    "12Х1": "для измерительного инструмента (плиток, калибров, шаблонов)",
    "4ХС":
        "для зубил, обжимок, ножниц при холодной и горячей резке металла; штампов горячей вытяжки",
    "6Х3МФС":
        "для пуассонов, работающих с повышенными динамическими нагрузками; для холодновысадочных штампов, штемпелей, клейм; чеканочных штампов и некоторых слесарно-монтажных инструментов",
    "8Х4В2МФС2":
        "для матриц и пуасонов штампов холодного объемного деформирования, испытывающих в процессе эксплуатации давление 0-2300 МПа, резьбонакатных роликов",
    "9Х1":
        "рабочие и опорные валки для холодной прокатки металлов. Рабочие валки рельсобалочных, крупносортных и проволочных обжимных и сортовых станов для горячей прокатки металлов, подвергающиеся интенсивному износу и работающие в условиях минимальных или умеренных ударных нагрузок. Опорные составные валки листовых станов для горячей прокатки металла. Клейма, пробойники, холодновысадочные штампы, деревообрабатывающий инструмент и другие детали.",
    "9ХФ":
        "для рамных, ленточных, круглых строгальных пил; штемпелей при холодной работе; ножей при холодной резке металла, обрезных матриц и пуасонов при холодной обрезке заусенцев; кернеров",
    "ХВ4":
        "для прошивных пуассонов,инструментов для чистового резания твердых материалов с небольшой скоростью и граверных работ",
    "ХВСГФ": "для круглых плашек, разверток и другого режущего инструмента",
    "60ХГ":
        "рабочие валки штрипсовых и мелкосортных станов для горячей прокатки металлов.",
    "75ХМФ":
        "рабочие и опорные кованые валки листовых станов для горячей прокатки черных металлов.",
    "90ХФ":
        "рамные, ленточные, круглые пилы, ножи для холодной резки металла, обрезные матрицы и пуансоны холодной обрезки заусенцев, кернеры. Рабочие и опорные валки для холодной прокатки металла. Рабочие валки рельсобалочных, крупносортных и проволочных обжимных и сортовых станов для горячей прокатки металла, подвергающиеся интенсивному износу и работающие в условиях минимальных или умеренных ударных нагрузок. Рабочие валки, опорные валки и бандажи составных опорных валков листовых, обжимных и сортовых станов для горячей прокатки металла.",
    "3Х2Н2МВФ":
        "ответственные детали прессового инструмента с высокими свойствами прочности и удовлетворительной пластичностью после нормализации и отпуска: втулки контейнеров, пресс-штемпели, иглы и другие детали, работающие при повышенных температурах 0-500 °С.",
    "4Х2НМФ":
        "ковочные штампы с высотой кубика 0-700 мм для горячей штамповки деталей из труднодеформируемых материалов.",
    "4Х5МФ1С":
        "пресс-формы литья под давлением цинковых, алюминиевых и магниевых сплавов, молотовые и прессовые вставки (сечением 0-200—250 мм) при горячем деформировании конструкционных сталей, инструмент для высадки заготовок из легированных конструкционных и жаропрочных материалов на горизонтально-ковочных машинах.",
    "5Х2МНФ":
        "для крупногабаритных цельных штампов (диаметром 0-600 мм) для штамповки поковок из конструкционных сталей и жаропрочных сплавов на молотах и кривошипных прессах; зажимных и формующих вставок, наборных и формовочных пуасонов для высадки конструкционных сталей и жаропрочных сплавов на горизонтальноковочных машинах; ножей горячей резки",
    "5ХНМ":
        "молотовые штампы паровоздушных и пневматических молотов с массой падающих частей свыше 3 т, прессовые штампы и штампы машинной скоростной штамповки при горячем деформировании легких цветных сплавов, блоки матриц для вставок горизонтально-ковочных машин.",
    "7Х3":
        "инструмент (пуансоны, матрицы) горячей высадки крепежа и заготовок из углеродистых и низколегированных конструкционных сталей на горизонтально-ковочных машинах, детали штампов (матрицы, пуансоны, выталкиватели) для горячего прессования и выдавливания этих материалов на кривошипных прессах, гибочные, обрезные и просечные штампы.",
    "8Х4В3М3Ф2":
        "для изготовления резьбонакатных инструментов для холодной накатки, шлиценакатных роликов; деревообрабатывающих инструментов; ножей труборазрубочных прессов, гильотинных и других ножниц; пуансонов и матриц холодного объемного деформирования, эксплуатируемых с рабочими давлениями 0-2000-2100 мПа",
    "Х12М":
        "для изготовления накатных роликов, волочильных досок и волок, глазков для калибрования металла; матриц и пуансонов вырубных штампов; пуансонов и матриц холодного выдавливания, эксплуатируемых с рабочими давлениями 0-1400-1600 мПа",
    "Х6Ф4М": "для изготовления штампов",
    "Р10Ф5К5":
        "для изготовления получистовых и черновых инструментов при различных труднообрабатываемых материалов",
    "Р18":
        "резцы, сверла, фрезы, резьбовые фрезы, долбяки, развертки, зенкеры, метчики, протяжки для обработки конструкционных сталей с прочностью 0-1000 МПа, от которых требуется сохранение режущих свойств при нагревании во время работы",
    "Р2АМ9К5":
        "для режущих инструментов при обработке улучшенных легированных, а также нержавеющих сталей",
    "Р6М5К5":
        "для обработки высокопрочных нержавеющих и жаропрочных сталей и сплавов в условиях повышенного разогрева режущей кромки.",
    "Р9К5":
        "для обработки высокопрочных, нержавеющих и жаропрочных сталей и сплавов",
  };
  final List<String> elChars = [
    "А",
    "В",
    "Г",
    "Д",
    "З",
    "К",
    "М",
    "Н",
    "О",
    "П",
    "Р",
    "С",
    "Т",
    "У",
    "Ф",
    "Х",
    "Ц",
    "Ш",
    "Ю",
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    '<',
  ];
  late String titleText;
  Map<String, String> knownChars = {};

  late String targetGrade;
  List<List<String>> guesses = [];
  List<String> currentGuess = [];
  late int gradeIndex;
  int maxAttempts = 6;
  bool gameOver = false;
  bool isWin = false;
  bool isOnboarding = true;
  int gamesPlayed = 0;
  int gamesWon = 0;

  void startNewGame() {
    knownChars = {for (var item in elChars) item: ''};
    gradeIndex = Random().nextInt(steelGrades.length);
    titleText = 'Сплав №${gradeIndex}';
    targetGrade = steelGrades.keys.elementAt(gradeIndex);
    guesses = [];
    currentGuess = [];
    gameOver = false;
    isWin = false;
    if (isOnboarding) {
      isOnboarding = false;
      titleText =
          'Вы должны угадать сплав за 6 попыток, а цвет элементов изменится, чтобы показать, насколько вы близки к отгадке. Чтобы начать игру, просто введите любую марку, например:';
      targetGrade = "Р6М5К5";
      guesses = [
        ["4", "Х", "2", "Н", "М", "Ф"],
        ["Р", "9", "М", "6", "К", "8"],
        ["Р", "6", "М", "7", "К", "9"],
        ["Р", "6", "М", "3", "К", "5"],
        ["Р", "6", "М", "Г", "К", "5"],
        ["Р", "6", "М", "5", "К", "5"],
      ];
      knownChars["4"] = 'grey';
      knownChars["Х"] = 'grey';
      knownChars["2"] = 'grey';
      knownChars["Н"] = 'grey';
      knownChars["М"] = 'green';
      knownChars["Р"] = 'grey';
      knownChars["9"] = 'grey';
      knownChars["8"] = 'grey';
      knownChars["6"] = 'green';
      knownChars["3"] = 'grey';
      knownChars["5"] = 'green';
      knownChars["Г"] = 'grey';
      knownChars["К"] = 'green';

      gameOver = true;
    }
  }

  void makeGuess() {
    if (currentGuess.length != targetGrade.length) return;

    guesses.add(currentGuess);

    if (currentGuess.join() == targetGrade) {
      gameOver = true;
      isWin = true;
      gamesWon++;
      gamesPlayed++;
    } else if (guesses.length >= maxAttempts) {
      gameOver = true;
      gamesPlayed++;
    }
    currentGuess = [];
  }

  void onCharacterPressed(String char) {
    if (char == '<' && currentGuess.isNotEmpty) {
      currentGuess = currentGuess.sublist(0, currentGuess.length - 1);
    } else if (char != '<' && currentGuess.length < targetGrade.length) {
      currentGuess.add(char);
    }
  }

  String getCharColor(
      String char, int index, List<String> guess, bool isGuess) {
    if (!isGuess) return 'orange';

    if (char == targetGrade[index]) {
      knownChars[char] = 'green';
      return 'green';
    } else if (targetGrade.contains(char)) {
      knownChars[char] = 'yellow';
      return 'yellow';
    }
    knownChars[char] = 'grey';
    return 'grey';
  }
}
