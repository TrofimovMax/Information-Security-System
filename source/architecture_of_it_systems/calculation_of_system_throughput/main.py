import math
from dataclasses import dataclass

SECONDS_IN_DAY = 86_400
DAYS_IN_YEAR = 365
KB = 1024
MB = KB ** 2
GB = KB ** 3
TB = KB ** 4


def input_int_default(prompt: str, default: int, min_value: int = 0) -> int:
    while True:
        user_input = input(f"{prompt} [{default}]: ").strip()
        if not user_input:
            return default

        try:
            value = int(user_input.replace("_", ""))
        except ValueError:
            print("Ошибка: введите целое число.")
            continue

        if value < min_value:
            print(f"Введите число не меньше {min_value}")
            continue

        return value


def input_float_default(prompt: str, default: float, min_value: float = 0.0) -> float:
    while True:
        user_input = input(f"{prompt} [{default}]: ").strip()
        if not user_input:
            return default

        try:
            value = float(user_input.replace("_", "").replace(",", "."))
        except ValueError:
            print("Ошибка: введите число.")
            continue

        if value < min_value:
            print(f"Введите число не меньше {min_value}")
            continue

        return value


def bytes_to_mb(value: float) -> float:
    return value / MB


def bytes_to_gb(value: float) -> float:
    return value / GB


def bytes_to_tb(value: float) -> float:
    return value / TB


def fmt(value: float, digits: int = 2) -> str:
    return f"{value:,.{digits}f}"


def print_section(title: str) -> None:
    print("\n" + "=" * 80)
    print(title)
    print("=" * 80)


def print_formula(label: str, formula: str, result: str) -> None:
    print(label)
    print(f"  Формула:  {formula}")
    print(f"  Результат: {result}")


@dataclass(frozen=True)
class InputData:
    dau: int
    requests_per_user_per_day: float
    avg_text_size_bytes: float
    image_ratio: float
    avg_image_size_bytes: float
    read_part: float
    write_part: float
    years: float
    replication_coefficient: float
    reserve_storage_ratio: float
    peak_multiplier: float
    cache_ratio: float
    web_server_qps_capacity: float
    db_storage_per_server_tb: float
    cache_storage_per_server_tb: float


@dataclass(frozen=True)
class CalculatedData:
    total_requests_per_day: float
    avg_qps: float
    peak_qps: float

    read_ratio: float
    write_ratio: float
    avg_read_qps: float
    avg_write_qps: float
    peak_read_qps: float
    peak_write_qps: float

    writes_per_day: float
    avg_record_size_bytes: float
    storage_per_day_bytes: float
    days: float
    base_storage_for_period_bytes: float
    storage_multiplier: float
    total_storage_per_day_bytes: float
    total_storage_for_period_bytes: float
    cache_size_bytes: float

    avg_read_bandwidth_bytes_per_sec: float
    avg_write_bandwidth_bytes_per_sec: float
    peak_read_bandwidth_bytes_per_sec: float
    peak_write_bandwidth_bytes_per_sec: float

    app_servers_raw: float
    app_servers_final: int
    db_servers_raw: float
    db_servers_final: int
    cache_servers_raw: float
    cache_servers_final: int
    total_servers: int


def read_input() -> InputData:
    print_section("Ввод исходных данных")

    dau = input_int_default(
        "Количество уникальных пользователей в день, DAU",
        default=50_000_000,
        min_value=1,
    )

    requests_per_user_per_day = input_float_default(
        "Среднее количество запросов на пользователя в день",
        default=20,
        min_value=0,
    )

    avg_text_size_bytes = input_float_default(
        "Средний размер текстовых данных в одном write-запросе, байт",
        default=500,
        min_value=0,
    )

    image_ratio = input_float_default(
        "Доля write-запросов с изображением, %",
        default=10,
        min_value=0,
    ) / 100

    avg_image_size_kb = input_float_default(
        "Средний размер изображения, КБ",
        default=200,
        min_value=0,
    )

    print("\nСоотношение чтение/запись, например 5:1")

    read_part = input_float_default(
        "Чтение",
        default=5,
        min_value=0,
    )

    write_part = input_float_default(
        "Запись",
        default=1,
        min_value=0,
    )

    if read_part + write_part == 0:
        raise ValueError("Сумма частей чтения и записи не может быть 0.")

    years = input_float_default(
        "Период хранения, лет",
        default=3,
        min_value=0,
    )

    replication_coefficient = input_float_default(
        "Коэффициент репликации для формулы хранения, например 3 = +300%",
        default=3,
        min_value=0,
    )

    reserve_storage_ratio = input_float_default(
        "Резервное хранилище, % от базового объема",
        default=20,
        min_value=0,
    ) / 100

    peak_multiplier = input_float_default(
        "Пиковый множитель QPS, обычно 2-5",
        default=3,
        min_value=1,
    )

    cache_ratio = input_float_default(
        "Размер кэша, % от итогового объема хранения",
        default=20,
        min_value=0,
    ) / 100

    web_server_qps_capacity = input_float_default(
        "Нагрузка, которую выдерживает один web/app сервер, QPS",
        default=2000,
        min_value=1,
    )

    db_storage_per_server_tb = input_float_default(
        "Объем данных, который может хранить один DB сервер, ТБ",
        default=10,
        min_value=1,
    )

    cache_storage_per_server_tb = input_float_default(
        "Объем данных, который может хранить один cache сервер, ТБ",
        default=1,
        min_value=1,
    )

    return InputData(
        dau=dau,
        requests_per_user_per_day=requests_per_user_per_day,
        avg_text_size_bytes=avg_text_size_bytes,
        image_ratio=image_ratio,
        avg_image_size_bytes=avg_image_size_kb * KB,
        read_part=read_part,
        write_part=write_part,
        years=years,
        replication_coefficient=replication_coefficient,
        reserve_storage_ratio=reserve_storage_ratio,
        peak_multiplier=peak_multiplier,
        cache_ratio=cache_ratio,
        web_server_qps_capacity=web_server_qps_capacity,
        db_storage_per_server_tb=db_storage_per_server_tb,
        cache_storage_per_server_tb=cache_storage_per_server_tb,
    )


def calculate(data: InputData) -> CalculatedData:
    total_parts = data.read_part + data.write_part

    read_ratio = data.read_part / total_parts
    write_ratio = data.write_part / total_parts

    total_requests_per_day = data.dau * data.requests_per_user_per_day
    avg_qps = total_requests_per_day / SECONDS_IN_DAY
    peak_qps = avg_qps * data.peak_multiplier

    avg_read_qps = avg_qps * read_ratio
    avg_write_qps = avg_qps * write_ratio
    peak_read_qps = peak_qps * read_ratio
    peak_write_qps = peak_qps * write_ratio

    writes_per_day = total_requests_per_day * write_ratio

    avg_record_size_bytes = (
        data.avg_text_size_bytes
        + data.image_ratio * data.avg_image_size_bytes
    )

    storage_per_day_bytes = writes_per_day * avg_record_size_bytes

    days = data.years * DAYS_IN_YEAR
    base_storage_for_period_bytes = storage_per_day_bytes * days

    storage_multiplier = (
        1
        + data.replication_coefficient
        + data.reserve_storage_ratio
    )

    total_storage_per_day_bytes = storage_per_day_bytes * storage_multiplier
    total_storage_for_period_bytes = (
        base_storage_for_period_bytes * storage_multiplier
    )

    cache_size_bytes = total_storage_for_period_bytes * data.cache_ratio

    avg_read_bandwidth_bytes_per_sec = avg_read_qps * avg_record_size_bytes
    avg_write_bandwidth_bytes_per_sec = avg_write_qps * avg_record_size_bytes
    peak_read_bandwidth_bytes_per_sec = peak_read_qps * avg_record_size_bytes
    peak_write_bandwidth_bytes_per_sec = peak_write_qps * avg_record_size_bytes

    app_servers_raw = (
        peak_read_qps + peak_write_qps
    ) / data.web_server_qps_capacity

    app_servers_final = math.ceil(app_servers_raw)

    db_servers_raw = (
        bytes_to_tb(total_storage_for_period_bytes)
        / data.db_storage_per_server_tb
    )

    db_servers_final = math.ceil(db_servers_raw)

    cache_servers_raw = (
        bytes_to_tb(cache_size_bytes)
        / data.cache_storage_per_server_tb
    )

    cache_servers_final = math.ceil(cache_servers_raw)

    total_servers = (
        app_servers_final
        + db_servers_final
        + cache_servers_final
    )

    return CalculatedData(
        total_requests_per_day=total_requests_per_day,
        avg_qps=avg_qps,
        peak_qps=peak_qps,
        read_ratio=read_ratio,
        write_ratio=write_ratio,
        avg_read_qps=avg_read_qps,
        avg_write_qps=avg_write_qps,
        peak_read_qps=peak_read_qps,
        peak_write_qps=peak_write_qps,
        writes_per_day=writes_per_day,
        avg_record_size_bytes=avg_record_size_bytes,
        storage_per_day_bytes=storage_per_day_bytes,
        days=days,
        base_storage_for_period_bytes=base_storage_for_period_bytes,
        storage_multiplier=storage_multiplier,
        total_storage_per_day_bytes=total_storage_per_day_bytes,
        total_storage_for_period_bytes=total_storage_for_period_bytes,
        cache_size_bytes=cache_size_bytes,
        avg_read_bandwidth_bytes_per_sec=avg_read_bandwidth_bytes_per_sec,
        avg_write_bandwidth_bytes_per_sec=avg_write_bandwidth_bytes_per_sec,
        peak_read_bandwidth_bytes_per_sec=peak_read_bandwidth_bytes_per_sec,
        peak_write_bandwidth_bytes_per_sec=peak_write_bandwidth_bytes_per_sec,
        app_servers_raw=app_servers_raw,
        app_servers_final=app_servers_final,
        db_servers_raw=db_servers_raw,
        db_servers_final=db_servers_final,
        cache_servers_raw=cache_servers_raw,
        cache_servers_final=cache_servers_final,
        total_servers=total_servers,
    )


def print_traffic_metrics(data: InputData, calc: CalculatedData) -> None:
    print_section("1. Показатели трафика")

    print_formula(
        "Количество уникальных пользователей",
        "DAU",
        f"{data.dau:,} пользователей/день",
    )

    print_formula(
        "Количество запросов в сутки",
        (
            "DAU * запросов_на_пользователя = "
            f"{data.dau:,} * {fmt(data.requests_per_user_per_day)}"
        ),
        f"{fmt(calc.total_requests_per_day)} запросов/сутки",
    )

    print_formula(
        "Среднее количество запросов в секунду",
        (
            "запросов_в_сутки / 86 400 = "
            f"{fmt(calc.total_requests_per_day)} / {SECONDS_IN_DAY:,}"
        ),
        f"{fmt(calc.avg_qps)} QPS",
    )

    print_formula(
        "Пиковое значение QPS",
        (
            "средний_QPS * пиковый_множитель = "
            f"{fmt(calc.avg_qps)} * {fmt(data.peak_multiplier)}"
        ),
        f"{fmt(calc.peak_qps)} QPS",
    )


def print_storage_metrics(data: InputData, calc: CalculatedData) -> None:
    print_section("2. Метрики хранения")

    print_formula(
        "Средний размер одной записи",
        (
            "текст + доля_изображений * размер_изображения = "
            f"{fmt(data.avg_text_size_bytes)} B + "
            f"{fmt(data.image_ratio)} * {fmt(data.avg_image_size_bytes)} B"
        ),
        f"{fmt(calc.avg_record_size_bytes)} байт",
    )

    print_formula(
        "Количество write-запросов в сутки",
        (
            "запросов_в_сутки * доля_записи = "
            f"{fmt(calc.total_requests_per_day)} * {fmt(calc.write_ratio)}"
        ),
        f"{fmt(calc.writes_per_day)} write-запросов/сутки",
    )

    print_formula(
        "Базовый объем хранения в день",
        (
            "write_запросов_в_сутки * размер_записи = "
            f"{fmt(calc.writes_per_day)} * "
            f"{fmt(calc.avg_record_size_bytes)} B"
        ),
        f"{fmt(bytes_to_gb(calc.storage_per_day_bytes))} ГБ/день",
    )

    print_formula(
        f"Базовый объем хранения за {fmt(data.years)} лет",
        (
            "базовый_объем_в_день * дней = "
            f"{fmt(bytes_to_gb(calc.storage_per_day_bytes))} ГБ * "
            f"{fmt(calc.days)}"
        ),
        f"{fmt(bytes_to_tb(calc.base_storage_for_period_bytes))} ТБ",
    )

    print_formula(
        "Итоговый множитель хранения",
        (
            "1 + коэффициент_репликации + резервное_хранилище = "
            f"1 + {fmt(data.replication_coefficient)} + "
            f"{fmt(data.reserve_storage_ratio)}"
        ),
        f"{fmt(calc.storage_multiplier)}x",
    )

    print_formula(
        "Общий объем данных, подлежащих хранению в день",
        (
            "базовый_объем_в_день * множитель = "
            f"{fmt(bytes_to_gb(calc.storage_per_day_bytes))} ГБ * "
            f"{fmt(calc.storage_multiplier)}"
        ),
        f"{fmt(bytes_to_gb(calc.total_storage_per_day_bytes))} ГБ/день",
    )

    print_formula(
        f"Общий объем данных, подлежащих хранению за {fmt(data.years)} лет",
        (
            "базовый_объем_за_период * множитель = "
            f"{fmt(bytes_to_tb(calc.base_storage_for_period_bytes))} ТБ * "
            f"{fmt(calc.storage_multiplier)}"
        ),
        f"{fmt(bytes_to_tb(calc.total_storage_for_period_bytes))} ТБ",
    )

    print_formula(
        "Объем кэша",
        (
            "итоговый_объем_хранения * процент_кэша = "
            f"{fmt(bytes_to_tb(calc.total_storage_for_period_bytes))} ТБ * "
            f"{fmt(data.cache_ratio)}"
        ),
        f"{fmt(bytes_to_tb(calc.cache_size_bytes))} ТБ",
    )


def print_performance_metrics(data: InputData, calc: CalculatedData) -> None:
    print_section("3. Показатели эффективности")

    print(f"Соотношение чтение/запись: {data.read_part:g}:{data.write_part:g}")
    print(f"Доля чтения: {fmt(calc.read_ratio * 100)}%")
    print(f"Доля записи: {fmt(calc.write_ratio * 100)}%")

    print_formula(
        "Средняя пропускная способность чтения, операций/сек",
        (
            "средний_QPS * доля_чтения = "
            f"{fmt(calc.avg_qps)} * {fmt(calc.read_ratio)}"
        ),
        f"{fmt(calc.avg_read_qps)} read ops/sec",
    )

    print_formula(
        "Пиковая пропускная способность чтения, операций/сек",
        (
            "peak_QPS * доля_чтения = "
            f"{fmt(calc.peak_qps)} * {fmt(calc.read_ratio)}"
        ),
        f"{fmt(calc.peak_read_qps)} read ops/sec",
    )

    print_formula(
        "Средняя пропускная способность записи, операций/сек",
        (
            "средний_QPS * доля_записи = "
            f"{fmt(calc.avg_qps)} * {fmt(calc.write_ratio)}"
        ),
        f"{fmt(calc.avg_write_qps)} write ops/sec",
    )

    print_formula(
        "Пиковая пропускная способность записи, операций/сек",
        (
            "peak_QPS * доля_записи = "
            f"{fmt(calc.peak_qps)} * {fmt(calc.write_ratio)}"
        ),
        f"{fmt(calc.peak_write_qps)} write ops/sec",
    )

    print_formula(
        "Средний bandwidth чтения",
        (
            "read_ops/sec * размер_записи = "
            f"{fmt(calc.avg_read_qps)} * "
            f"{fmt(calc.avg_record_size_bytes)} B"
        ),
        f"{fmt(bytes_to_mb(calc.avg_read_bandwidth_bytes_per_sec))} МБ/сек",
    )

    print_formula(
        "Пиковый bandwidth чтения",
        (
            "peak_read_ops/sec * размер_записи = "
            f"{fmt(calc.peak_read_qps)} * "
            f"{fmt(calc.avg_record_size_bytes)} B"
        ),
        f"{fmt(bytes_to_mb(calc.peak_read_bandwidth_bytes_per_sec))} МБ/сек",
    )

    print_formula(
        "Средний bandwidth записи",
        (
            "write_ops/sec * размер_записи = "
            f"{fmt(calc.avg_write_qps)} * "
            f"{fmt(calc.avg_record_size_bytes)} B"
        ),
        f"{fmt(bytes_to_mb(calc.avg_write_bandwidth_bytes_per_sec))} МБ/сек",
    )

    print_formula(
        "Пиковый bandwidth записи",
        (
            "peak_write_ops/sec * размер_записи = "
            f"{fmt(calc.peak_write_qps)} * "
            f"{fmt(calc.avg_record_size_bytes)} B"
        ),
        f"{fmt(bytes_to_mb(calc.peak_write_bandwidth_bytes_per_sec))} МБ/сек",
    )


def print_server_metrics(data: InputData, calc: CalculatedData) -> None:
    print_section("4. Расчет количества серверов")

    print_formula(
        "Серверы приложений / Web/App",
        (
            "(Peak Read QPS + Peak Write QPS) / нагрузка_одного_web_сервера = "
            f"({fmt(calc.peak_read_qps)} + {fmt(calc.peak_write_qps)}) / "
            f"{fmt(data.web_server_qps_capacity)}"
        ),
        (
            f"{fmt(calc.app_servers_raw)} => "
            f"{calc.app_servers_final:,} серверов после округления вверх"
        ),
    )

    print_formula(
        "Серверы БД",
        (
            "общий_объем_данных / объем_данных_на_один_DB_сервер = "
            f"{fmt(bytes_to_tb(calc.total_storage_for_period_bytes))} ТБ / "
            f"{fmt(data.db_storage_per_server_tb)} ТБ"
        ),
        (
            f"{fmt(calc.db_servers_raw)} => "
            f"{calc.db_servers_final:,} серверов после округления вверх"
        ),
    )

    print_formula(
        "Cache-серверы",
        (
            "объем_кэша / объем_данных_на_один_cache_сервер = "
            f"{fmt(bytes_to_tb(calc.cache_size_bytes))} ТБ / "
            f"{fmt(data.cache_storage_per_server_tb)} ТБ"
        ),
        (
            f"{fmt(calc.cache_servers_raw)} => "
            f"{calc.cache_servers_final:,} серверов после округления вверх"
        ),
    )

    print_formula(
        "Итого серверов",
        (
            "app_servers + db_servers + cache_servers = "
            f"{calc.app_servers_final:,} + "
            f"{calc.db_servers_final:,} + "
            f"{calc.cache_servers_final:,}"
        ),
        f"{calc.total_servers:,} серверов",
    )


def print_summary(data: InputData, calc: CalculatedData) -> None:
    print_section("Итог")

    print(f"DAU: {data.dau:,}")
    print(f"Запросов на пользователя в день: {fmt(data.requests_per_user_per_day)}")
    print(f"Средний QPS: {fmt(calc.avg_qps)}")
    print(f"Пиковый QPS: {fmt(calc.peak_qps)}")
    print(
        "Read QPS средний / пиковый: "
        f"{fmt(calc.avg_read_qps)} / {fmt(calc.peak_read_qps)}"
    )
    print(
        "Write QPS средний / пиковый: "
        f"{fmt(calc.avg_write_qps)} / {fmt(calc.peak_write_qps)}"
    )
    print(
        "Хранение в день, базовое / итоговое: "
        f"{fmt(bytes_to_gb(calc.storage_per_day_bytes))} / "
        f"{fmt(bytes_to_gb(calc.total_storage_per_day_bytes))} ГБ"
    )
    print(
        f"Хранение за {fmt(data.years)} лет, базовое / итоговое: "
        f"{fmt(bytes_to_tb(calc.base_storage_for_period_bytes))} / "
        f"{fmt(bytes_to_tb(calc.total_storage_for_period_bytes))} ТБ"
    )
    print(f"Кэш: {fmt(bytes_to_tb(calc.cache_size_bytes))} ТБ")
    print(f"App/Web серверов: {calc.app_servers_final:,}")
    print(f"DB серверов: {calc.db_servers_final:,}")
    print(f"Cache серверов: {calc.cache_servers_final:,}")
    print(f"Всего серверов: {calc.total_servers:,}")


def main() -> None:
    try:
        data = read_input()
        calc = calculate(data)
    except ValueError as error:
        print(f"Ошибка: {error}")
        return

    print_traffic_metrics(data, calc)
    print_storage_metrics(data, calc)
    print_performance_metrics(data, calc)
    print_server_metrics(data, calc)
    print_summary(data, calc)


if __name__ == "__main__":
    main()
