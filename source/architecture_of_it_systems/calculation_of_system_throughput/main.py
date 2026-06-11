import math


SECONDS_IN_DAY = 86_400
KB = 1024


def input_int_default(prompt: str, default: int, min_value: int = 0) -> int:
    while True:
        user_input = input(f"{prompt} [{default}]: ").strip()

        if user_input == "":
            return default

        try:
            value = int(user_input.replace("_", ""))
            if value < min_value:
                print(f"Введите число не меньше {min_value}")
                continue
            return value
        except ValueError:
            print("Ошибка: введите целое число.")


def input_float_default(prompt: str, default: float, min_value: float = 0.0) -> float:
    while True:
        user_input = input(f"{prompt} [{default}]: ").strip()

        if user_input == "":
            return default

        try:
            value = float(user_input.replace("_", "").replace(",", "."))
            if value < min_value:
                print(f"Введите число не меньше {min_value}")
                continue
            return value
        except ValueError:
            print("Ошибка: введите число.")


def bytes_to_mb(value: float) -> float:
    return value / 1024 / 1024


def bytes_to_gb(value: float) -> float:
    return value / 1024 / 1024 / 1024


def bytes_to_tb(value: float) -> float:
    return value / 1024 / 1024 / 1024 / 1024


def print_section(title: str):
    print("\n" + "=" * 60)
    print(title)
    print("=" * 60)


def main():
    print_section("Ввод исходных данных")

    unique_users_per_day = input_int_default(
        "Количество уникальных пользователей, например 50 млн DAU",
        default=50_000_000,
        min_value=1
    )

    avg_requests_per_user_per_day = input_float_default(
        "В среднем каждый пользователь отправляет, например 20, запросов в день",
        default=20,
        min_value=0
    )

    avg_text_size_bytes = input_float_default(
        "Средний размер текстовых данных, например 500, байт",
        default=500,
        min_value=0
    )

    image_percent = input_float_default(
        "Например 10%, пользователей содержат изображение",
        default=10,
        min_value=0
    ) / 100

    avg_image_size_kb = input_float_default(
        "Средний размер изображения, например 200, КБ",
        default=200,
        min_value=0
    )

    avg_image_size_bytes = avg_image_size_kb * KB

    print("\nСоотношение чтение/запись, например 5:1")

    read_part = input_float_default(
        "Чтение",
        default=5,
        min_value=0
    )

    write_part = input_float_default(
        "Запись",
        default=1,
        min_value=0
    )

    total_parts = read_part + write_part
    if total_parts == 0:
        print("Ошибка: сумма частей чтения и записи не может быть 0.")
        return

    read_ratio = read_part / total_parts
    write_ratio = write_part / total_parts

    years = input_float_default(
        "Хранение, например 3, года",
        default=3,
        min_value=0
    )

    replication_factor = input_float_default(
        "Репликация, например 3, x",
        default=3,
        min_value=1
    )

    peak_multiplier = input_float_default(
        "Пиковый множитель, например 3, x",
        default=3,
        min_value=1
    )

    cache_percent = input_float_default(
        "Размер кэша, например 20%",
        default=20,
        min_value=0
    ) / 100

    qps_per_server = input_float_default(
        "QPS одного сервера, например 2000, QPS",
        default=2000,
        min_value=1
    )

    print_section("Ввод параметров серверов")

    web_server_connections = input_int_default(
        "Одновременных подключений на один web/app сервер, например 50000",
        default=50_000,
        min_value=1
    )

    storage_per_server_tb = input_float_default(
        "Хранилище на один сервер, например 10, ТБ",
        default=10,
        min_value=1
    )

    reservation_percent = input_float_default(
        "Процент резервирования хранилища, например 0%",
        default=0,
        min_value=0
    )

    reservation_multiplier = 1 + reservation_percent / 100
    storage_multiplier = replication_factor * reservation_multiplier

    print_section("Расчет QPS")

    total_requests_per_day = unique_users_per_day * avg_requests_per_user_per_day

    avg_qps = total_requests_per_day / SECONDS_IN_DAY
    max_qps = avg_qps * peak_multiplier

    read_qps = avg_qps * read_ratio
    write_qps = avg_qps * write_ratio

    read_qps_max = max_qps * read_ratio
    write_qps_max = max_qps * write_ratio

    print(f"Всего запросов в сутки: {total_requests_per_day:,.2f}")
    print(f"Средний QPS: {avg_qps:,.2f}")
    print(f"Пиковый QPS MAX: {max_qps:,.2f}")
    print(f"Соотношение чтение/запись: {read_part:g}:{write_part:g}")
    print(f"Доля чтения: {read_ratio * 100:,.2f}%")
    print(f"Доля записи: {write_ratio * 100:,.2f}%")
    print(f"Read QPS средний: {read_qps:,.2f}")
    print(f"Write QPS средний: {write_qps:,.2f}")
    print(f"Read QPS MAX: {read_qps_max:,.2f}")
    print(f"Write QPS MAX: {write_qps_max:,.2f}")

    print_section("Расчет создаваемых данных")

    write_requests_per_day = total_requests_per_day * write_ratio

    text_data_per_day_bytes = write_requests_per_day * avg_text_size_bytes

    image_requests_per_day = write_requests_per_day * image_percent
    image_data_per_day_bytes = image_requests_per_day * avg_image_size_bytes

    total_data_per_day_bytes = text_data_per_day_bytes + image_data_per_day_bytes

    print(f"Запросов записи в сутки: {write_requests_per_day:,.2f}")
    print(f"Текстовых данных в сутки: {bytes_to_gb(text_data_per_day_bytes):,.2f} ГБ")
    print(f"Данных изображений в сутки: {bytes_to_gb(image_data_per_day_bytes):,.2f} ГБ")
    print(f"Базовый объем данных в сутки: {bytes_to_gb(total_data_per_day_bytes):,.2f} ГБ")

    print_section(f"Расчет объема данных за {years:g} лет")

    days = years * 365

    base_data_for_period_bytes = total_data_per_day_bytes * days
    text_data_for_period_bytes = text_data_per_day_bytes * days
    image_data_for_period_bytes = image_data_per_day_bytes * days

    total_storage_for_period_bytes = base_data_for_period_bytes * storage_multiplier

    print(f"Текстовых данных за период: {bytes_to_tb(text_data_for_period_bytes):,.2f} ТБ")
    print(f"Данных изображений за период: {bytes_to_tb(image_data_for_period_bytes):,.2f} ТБ")
    print(f"Базовый объем данных за период: {bytes_to_tb(base_data_for_period_bytes):,.2f} ТБ")
    print(f"Репликация: {replication_factor:g}x")
    print(f"Резервирование: {reservation_percent:g}%")
    print(f"Множитель резервирования: {reservation_multiplier:g}x")
    print(f"Итоговый множитель хранилища: {storage_multiplier:g}x")
    print(f"Итоговый объем хранилища за период: {bytes_to_tb(total_storage_for_period_bytes):,.2f} ТБ")

    print_section("Расчет пропускной способности")

    avg_record_size_bytes = avg_text_size_bytes + image_percent * avg_image_size_bytes

    read_bandwidth_bytes_per_sec = read_qps_max * avg_record_size_bytes
    write_bandwidth_bytes_per_sec = write_qps_max * avg_record_size_bytes

    print(f"Средний размер одной записи: {avg_record_size_bytes:,.2f} байт")
    print(f"Пропускная способность чтения: {bytes_to_mb(read_bandwidth_bytes_per_sec):,.2f} МБ/сек")
    print(f"Пропускная способность записи: {bytes_to_mb(write_bandwidth_bytes_per_sec):,.2f} МБ/сек")

    print_section("Расчет кэша")

    cache_size_bytes = total_storage_for_period_bytes * cache_percent

    print(f"Размер кэша: {cache_percent * 100:g}%")
    print(f"Объем кэша: {bytes_to_tb(cache_size_bytes):,.2f} ТБ")

    print_section("Расчет количества серверов")

    app_servers_by_qps = math.ceil(max_qps / qps_per_server)

    web_servers_by_connections = math.ceil(
        unique_users_per_day / web_server_connections
    )

    app_servers = max(app_servers_by_qps, web_servers_by_connections)

    db_servers_by_qps = math.ceil(write_qps_max / qps_per_server)

    db_servers_by_storage = math.ceil(
        bytes_to_tb(total_storage_for_period_bytes) / storage_per_server_tb
    )

    db_servers = max(db_servers_by_qps, db_servers_by_storage)

    cache_servers_by_qps = math.ceil(read_qps_max / qps_per_server)

    cache_servers_by_storage = math.ceil(
        bytes_to_tb(cache_size_bytes) / storage_per_server_tb
    )

    cache_servers = max(cache_servers_by_qps, cache_servers_by_storage)

    print(f"App/Web серверов по QPS: {app_servers_by_qps}")
    print(f"App/Web серверов по подключениям: {web_servers_by_connections}")
    print(f"Итого App/Web серверов: {app_servers}")

    print()

    print(f"DB серверов по Write QPS: {db_servers_by_qps}")
    print(f"DB серверов по хранилищу с учетом репликации и резерва: {db_servers_by_storage}")
    print(f"Итого DB серверов: {db_servers}")

    print()

    print(f"Cache серверов по Read QPS: {cache_servers_by_qps}")
    print(f"Cache серверов по объему кэша: {cache_servers_by_storage}")
    print(f"Итого Cache серверов: {cache_servers}")

    print_section("Итог")

    total_servers = app_servers + db_servers + cache_servers

    print(f"DAU: {unique_users_per_day:,.0f}")
    print(f"Запросов на пользователя в день: {avg_requests_per_user_per_day:,.2f}")
    print(f"Всего запросов в сутки: {total_requests_per_day:,.2f}")
    print(f"Средний QPS: {avg_qps:,.2f}")
    print(f"Пиковый QPS MAX: {max_qps:,.2f}")
    print(f"Read QPS MAX: {read_qps_max:,.2f}")
    print(f"Write QPS MAX: {write_qps_max:,.2f}")
    print(f"Базовые данные за {years:g} лет: {bytes_to_tb(base_data_for_period_bytes):,.2f} ТБ")
    print(f"Итоговое хранилище за {years:g} лет: {bytes_to_tb(total_storage_for_period_bytes):,.2f} ТБ")
    print(f"Кэш: {bytes_to_tb(cache_size_bytes):,.2f} ТБ")
    print(f"App/Web серверов: {app_servers}")
    print(f"DB серверов: {db_servers}")
    print(f"Cache серверов: {cache_servers}")
    print(f"Всего серверов: {total_servers}")


if __name__ == "__main__":
    main()
